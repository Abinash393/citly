import React, { useState, useEffect } from "react";
import { initializeLogger } from "common/logger";
import Header from "components/Header";
import linksApi from "apis/links";
import UrlCard from "components/UrlCard";
import Heading from "components/Heading";
import TopBar from "components/TopBar";

const App = () => {
  const [links, setLinks] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchLinks = async () => {
    try {
      const res = await linksApi.list();
      if (res && res.data.success) {
        setLinks(res.data.links);
      }
    } catch (err) {
      logger.error(err);
    } finally {
      setLoading(false);
    }
  };

  const setPinned = async id => {
    try {
      const res = await linksApi.pinned(id);
      if (res.data.success) {
        fetchLinks();
      }
    } catch (err) {
      logger.error(err);
    }
  };

  const addLink = async link => {
    try {
      const res = await linksApi.create({ link: { originalUrl: link } });
      if (res.data.success) {
        fetchLinks();
      }
    } catch (err) {
      logger.error(err);
    }
  };

  useEffect(() => {
    /*eslint no-undef: "off"*/
    initializeLogger();
    fetchLinks();
  }, []);

  return (
    <>
      <Header />
      <div className="container mx-auto">
        <div className="flex h-full">
          <div className="bg-white border mx-auto mt-16 md-8 w-3/4 px-2 py-4 rounded shadow-xl">
            <TopBar addLink={addLink} />
            <Heading />
            {links &&
                            links.map(link => (
                              <UrlCard
                                key={link.id}
                                setPinned={setPinned}
                                {...link}
                              />
                            ))}
          </div>
        </div>
      </div>
    </>
  );
};

export default App;
