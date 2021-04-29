import React, { useEffect } from "react";
import { initializeLogger } from "common/logger";

const App = () => {
  useEffect(() => {
    /*eslint no-undef: "off"*/
    initializeLogger();
    logger.info("Log from js-logger");
  }, []);

  return <h1>Hello, React!</h1>;
};

export default App;
