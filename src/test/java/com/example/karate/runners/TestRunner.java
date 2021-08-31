package com.example.karate.runners;

import com.example.karate.configuration.ProfileResolver;
import com.example.karate.configuration.TestConfiguration;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.springframework.test.util.AssertionErrors.assertTrue;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {TestConfiguration.class})
@ActiveProfiles(resolver = ProfileResolver.class)
public class TestRunner {

    @Test
    public void testParallel() {

        Results results = Runner.path("classpath:features").tags("~@ignore")
                .outputHtmlReport(true)
                .outputCucumberJson(true)
                .outputJunitXml(true)
                .parallel(1);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
}
