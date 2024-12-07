package com.project.health.essential;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public interface PLog {
	Logger log = LogManager.getLogger(PLog.class);
}
