import React from 'react'

import { Helmet } from 'react-helmet'

import './welcomescreen.css'

const Welcomescreen = (props) => {
  return (
    <div className="welcomescreen-container">
      <Helmet>
        <title>exported project</title>
      </Helmet>
      <div className="welcomescreen-welcomescreen">
        <div className="welcomescreen-group2">
          <span className="welcomescreen-text1 TitlePage">
            <span>HOA Insight</span>
          </span>
          <img
            alt="HOAInsightLogo113496"
            src="/external/hoainsightlogo113496-zzh-200h.png"
            className="welcomescreen-hoa-insight-logo11"
          />
        </div>
        <div className="welcomescreen-status-bari-phone13">
          <div className="welcomescreen-left-side">
            <div className="welcomescreen-frame-status-bartime">
              <span className="welcomescreen-text3 DefaultBoldBody">
                <span>9:41</span>
              </span>
            </div>
          </div>
          <div className="welcomescreen-right-side">
            <div className="welcomescreen-battery">
              <img
                alt="OutlineI349"
                src="/external/outlinei349-zcyk.svg"
                className="welcomescreen-outline"
              />
              <img
                alt="BatteryEndI349"
                src="/external/batteryendi349-pmpo.svg"
                className="welcomescreen-battery-end"
              />
              <img
                alt="FillI349"
                src="/external/filli349-pgtc.svg"
                className="welcomescreen-fill"
              />
            </div>
            <img
              alt="WifiI349"
              src="/external/wifii349-e1fx.svg"
              className="welcomescreen-wifi"
            />
            <img
              alt="IconMobileSignalI349"
              src="/external/iconmobilesignali349-7gko.svg"
              className="welcomescreen-icon-mobile-signal"
            />
          </div>
        </div>
        <img
          alt="Rectangle243491"
          src="/external/rectangle243491-muei-200h.png"
          className="welcomescreen-rectangle24"
        />
      </div>
    </div>
  )
}

export default Welcomescreen
