// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package musicdiscs.domain;

import musicdiscs.domain.TrackDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TrackIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TrackIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TrackIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TrackIntegrationTest: @Transactional;
    
    @Autowired
    private TrackDataOnDemand TrackIntegrationTest.dod;
    
    @Test
    public void TrackIntegrationTest.testCountTracks() {
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", dod.getRandomTrack());
        long count = musicdiscs.domain.Track.countTracks();
        org.junit.Assert.assertTrue("Counter for 'Track' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TrackIntegrationTest.testFindTrack() {
        musicdiscs.domain.Track obj = dod.getRandomTrack();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to provide an identifier", id);
        obj = musicdiscs.domain.Track.findTrack(id);
        org.junit.Assert.assertNotNull("Find method for 'Track' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Track' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TrackIntegrationTest.testFindAllTracks() {
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", dod.getRandomTrack());
        long count = musicdiscs.domain.Track.countTracks();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Track', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<musicdiscs.domain.Track> result = musicdiscs.domain.Track.findAllTracks();
        org.junit.Assert.assertNotNull("Find all method for 'Track' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Track' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TrackIntegrationTest.testFindTrackEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", dod.getRandomTrack());
        long count = musicdiscs.domain.Track.countTracks();
        if (count > 20) count = 20;
        java.util.List<musicdiscs.domain.Track> result = musicdiscs.domain.Track.findTrackEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Track' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Track' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TrackIntegrationTest.testFlush() {
        musicdiscs.domain.Track obj = dod.getRandomTrack();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to provide an identifier", id);
        obj = musicdiscs.domain.Track.findTrack(id);
        org.junit.Assert.assertNotNull("Find method for 'Track' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTrack(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Track' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TrackIntegrationTest.testMerge() {
        musicdiscs.domain.Track obj = dod.getRandomTrack();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to provide an identifier", id);
        obj = musicdiscs.domain.Track.findTrack(id);
        boolean modified =  dod.modifyTrack(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        musicdiscs.domain.Track merged = (musicdiscs.domain.Track) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Track' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TrackIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", dod.getRandomTrack());
        musicdiscs.domain.Track obj = dod.getNewTransientTrack(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Track' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Track' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TrackIntegrationTest.testRemove() {
        musicdiscs.domain.Track obj = dod.getRandomTrack();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Track' failed to provide an identifier", id);
        obj = musicdiscs.domain.Track.findTrack(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Track' with identifier '" + id + "'", musicdiscs.domain.Track.findTrack(id));
    }
    
}