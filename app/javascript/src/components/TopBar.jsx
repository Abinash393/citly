import React, { useState } from "react";
import linksApi from "apis/links";
import Logger from "js-logger";

const TopBar = ({ addLink }) => {
  const [url, setUrl] = useState("");

  return (
    <div className="flex justify-between mb-6 w-full h-10 rounded text-center font-bold text-xl">
      <input
        type="text"
        className="p-4 rounded-md border-2 border-gray-900 w- max-w-lg w-4/5"
        value={url}
        onChange={e => {
          setUrl(e.target.value);
        }}
        placeholder="www.youtube.com"
      />
      <span>
        <span>
          <button
            onClick={e => {
              addLink(url);
              setUrl("");
            }}
            className="ml-6 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
          >
                        Shorten
          </button>
        </span>
        <a href="/api/v1/links/download/">
          <button className="ml-6 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                        Download
          </button>
        </a>
      </span>
    </div>
  );
};

export default TopBar;
