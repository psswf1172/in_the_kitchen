!function(i){"function"==typeof define&&define.amd?define(["jquery"],i):"object"==typeof module&&module.exports?module.exports=function(e,t){return t===undefined&&(t="undefined"!=typeof window?require("jquery"):require("jquery")(e)),i(t)}:i(window.jQuery)}(function(G){G.extend(G.FE.POPUP_TEMPLATES,{"video.insert":"[_BUTTONS_][_BY_URL_LAYER_][_EMBED_LAYER_][_UPLOAD_LAYER_][_PROGRESS_BAR_]","video.edit":"[_BUTTONS_]","video.size":"[_BUTTONS_][_SIZE_LAYER_]"}),G.extend(G.FE.DEFAULTS,{videoAllowedTypes:["mp4","webm","ogg"],videoAllowedProviders:[".*"],videoDefaultAlign:"center",videoDefaultDisplay:"block",videoDefaultWidth:600,videoEditButtons:["videoReplace","videoRemove","|","videoDisplay","videoAlign","videoSize"],videoInsertButtons:["videoBack","|","videoByURL","videoEmbed","videoUpload"],videoMaxSize:52428800,videoMove:!0,videoResize:!0,videoSizeButtons:["videoBack","|"],videoSplitHTML:!1,videoTextNear:!0,videoUpload:!0,videoUploadMethod:"POST",videoUploadParam:"file",videoUploadParams:{},videoUploadToS3:!1,videoUploadURL:"https://i.froala.com/upload"}),G.FE.VIDEO_PROVIDERS=[{test_regex:/^.*((youtu.be)|(youtube.com))\/((v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))?\??v?=?([^#\&\?]*).*/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/)?([0-9a-zA-Z_\-]+)(.+)?/g,url_text:"https://www.youtube.com/embed/$1",html:'<iframe width="640" height="360" src="{url}?wmode=opaque" frameborder="0" allowfullscreen></iframe>',provider:"youtube"},{test_regex:/^.*(?:vimeo.com)\/(?:channels(\/\w+\/)?|groups\/*\/videos\/\u200b\d+\/|video\/|)(\d+)(?:$|\/|\?)/,url_regex:/(?:https?:\/\/)?(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/(?:[^\/]*)\/videos\/|album\/(?:\d+)\/video\/|video\/|)(\d+)(?:[a-zA-Z0-9_\-]+)?/i,url_text:"https://player.vimeo.com/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',provider:"vimeo"},{test_regex:/^.+(dailymotion.com|dai.ly)\/(video|hub)?\/?([^_]+)[^#]*(#video=([^_&]+))?/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:dailymotion\.com|dai\.ly)\/(?:video|hub)?\/?(.+)/g,url_text:"https://www.dailymotion.com/embed/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',provider:"dailymotion"},{test_regex:/^.+(screen.yahoo.com)\/[^_&]+/,url_regex:"",url_text:"",html:'<iframe width="640" height="360" src="{url}?format=embed" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>',provider:"yahoo"},{test_regex:/^.+(rutube.ru)\/[^_&]+/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:rutube\.ru)\/(?:video)?\/?(.+)/g,url_text:"https://rutube.ru/play/embed/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>',provider:"rutube"},{test_regex:/^(?:.+)vidyard.com\/(?:watch)?\/?([^.&/]+)\/?(?:[^_.&]+)?/,url_regex:/^(?:.+)vidyard.com\/(?:watch)?\/?([^.&/]+)\/?(?:[^_.&]+)?/g,url_text:"https://play.vidyard.com/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',provider:"vidyard"}],G.FE.VIDEO_EMBED_REGEX=/^\W*((<iframe.*><\/iframe>)|(<embed.*>))\W*$/i,G.FE.PLUGINS.video=function(p){function u(){var e=p.popups.get("video.insert");e.find(".fr-video-by-url-layer input").val("").trigger("change");var t=e.find(".fr-video-embed-layer textarea");t.val("").trigger("change"),(t=e.find(".fr-video-upload-layer input")).val("").trigger("change")}function i(){var e=p.popups.get("video.edit");if(e||(e=function(){var e="";if(0<p.opts.videoEditButtons.length){e+='<div class="fr-buttons">',e+=p.button.buildList(p.opts.videoEditButtons);var t={buttons:e+="</div>"},i=p.popups.create("video.edit",t);return p.events.$on(p.$wp,"scroll.video-edit",function(){N&&p.popups.isVisible("video.edit")&&(p.events.disableBlur(),d(N))}),i}return!1}()),e){p.popups.setContainer("video.edit",p.$sc),p.popups.refresh("video.edit");var t=N.find("iframe, embed, video"),i=t.offset().left+t.outerWidth()/2,o=t.offset().top+t.outerHeight();p.popups.show("video.edit",i,o,t.outerHeight())}}function n(e){if(e)return p.popups.onRefresh("video.insert",u),p.popups.onHide("image.insert",F),!0;var t="";p.opts.videoUpload||p.opts.videoInsertButtons.splice(p.opts.videoInsertButtons.indexOf("videoUpload"),1),1<p.opts.videoInsertButtons.length&&(t='<div class="fr-buttons">'+p.button.buildList(p.opts.videoInsertButtons)+"</div>");var i,o="",r=p.opts.videoInsertButtons.indexOf("videoUpload"),s=p.opts.videoInsertButtons.indexOf("videoByURL"),n=p.opts.videoInsertButtons.indexOf("videoEmbed");0<=s&&(i=" fr-active",(r<s&&0<=r||n<s&&0<=n)&&(i=""),o='<div class="fr-video-by-url-layer fr-layer'+i+'" id="fr-video-by-url-layer-'+p.id+'"><div class="fr-input-line"><input id="fr-video-by-url-layer-text-'+p.id+'" type="text" placeholder="'+p.language.translate("Paste in a video URL")+'" tabIndex="1" aria-required="true"></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertByURL" tabIndex="2" role="button">'+p.language.translate("Insert")+"</button></div></div>");var a="";0<=n&&(i=" fr-active",(r<n&&0<=r||s<n&&0<=s)&&(i=""),a='<div class="fr-video-embed-layer fr-layer'+i+'" id="fr-video-embed-layer-'+p.id+'"><div class="fr-input-line"><textarea id="fr-video-embed-layer-text'+p.id+'" type="text" placeholder="'+p.language.translate("Embedded Code")+'" tabIndex="1" aria-required="true" rows="5"></textarea></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertEmbed" tabIndex="2" role="button">'+p.language.translate("Insert")+"</button></div></div>");var d="";0<=r&&(i=" fr-active",(n<r&&0<=n||s<r&&0<=s)&&(i=""),d='<div class="fr-video-upload-layer fr-layer'+i+'" id="fr-video-upload-layer-'+p.id+'"><strong>'+p.language.translate("Drop video")+"</strong><br>("+p.language.translate("or click")+')<div class="fr-form"><input type="file" accept="video/'+p.opts.videoAllowedTypes.join(", video/").toLowerCase()+'" tabIndex="-1" aria-labelledby="fr-video-upload-layer-'+p.id+'" role="button"></div></div>');var l,f={buttons:t,by_url_layer:o,embed_layer:a,upload_layer:d,progress_bar:'<div class="fr-video-progress-bar-layer fr-layer"><h3 tabIndex="-1" class="fr-message">Uploading</h3><div class="fr-loader"><span class="fr-progress"></span></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-dismiss" data-cmd="videoDismissError" tabIndex="2" role="button">OK</button></div></div>'},v=p.popups.create("video.insert",f);return l=v,p.events.$on(l,"dragover dragenter",".fr-video-upload-layer",function(){return G(this).addClass("fr-drop"),!1},!0),p.events.$on(l,"dragleave dragend",".fr-video-upload-layer",function(){return G(this).removeClass("fr-drop"),!1},!0),p.events.$on(l,"drop",".fr-video-upload-layer",function(e){e.preventDefault(),e.stopPropagation(),G(this).removeClass("fr-drop");var t=e.originalEvent.dataTransfer;if(t&&t.files){var i=l.data("instance")||p;i.events.disableBlur(),i.video.upload(t.files),i.events.enableBlur()}},!0),p.helpers.isIOS()&&p.events.$on(l,"touchstart",'.fr-video-upload-layer input[type="file"]',function(){G(this).trigger("click")},!0),p.events.$on(l,"change",'.fr-video-upload-layer input[type="file"]',function(){if(this.files){var e=l.data("instance")||p;e.events.disableBlur(),l.find("input:focus").blur(),e.events.enableBlur(),e.video.upload(this.files)}G(this).val("")},!0),v}function r(e){p.events.focus(!0),p.selection.restore();var t=!1;N&&(k(),t=!0),p.html.insert('<span contenteditable="false" draggable="true" class="fr-jiv fr-video">'+e+"</span>",!1,p.opts.videoSplitHTML),p.popups.hide("video.insert");var i=p.$el.find(".fr-jiv");i.removeClass("fr-jiv"),O(i,p.opts.videoDefaultDisplay,p.opts.videoDefaultAlign),i.toggleClass("fr-draggable",p.opts.videoMove),p.events.trigger(t?"video.replaced":"video.inserted",[i])}function v(){var e=G(this);p.popups.hide("video.insert"),e.removeClass("fr-uploading"),e.parent().next().is("br")&&e.parent().next().remove(),d(e.parent()),p.events.trigger("video.loaded",[e.parent()])}function a(a,e,d,l,f){p.edit.off(),h("Loading video"),e&&(a=p.helpers.sanitizeURL(a)),c("Loading video"),function(){var e,t;if(l){p.undo.canDo()||l.find("video").hasClass("fr-uploading")||p.undo.saveStep();var i=l.find("video").data("fr-old-src"),o=l.data("fr-replaced");l.data("fr-replaced",!1),p.$wp?((e=l.clone()).find("video").removeData("fr-old-src").removeClass("fr-uploading"),e.find("video").off("canplay"),i&&l.find("video").attr("src",i),l.replaceWith(e)):e=l;for(var r=e.find("video").get(0).attributes,s=0;s<r.length;s++){var n=r[s];0===n.nodeName.indexOf("data-")&&e.find("video").removeAttr(n.nodeName)}if(void 0!==d)for(t in d)d.hasOwnProperty(t)&&"link"!=t&&e.find("video").attr("data-"+t,d[t]);e.find("video").on("canplay",v),e.find("video").attr("src",a),p.edit.on(),C(),p.undo.saveStep(),p.$el.blur(),p.events.trigger(o?"video.replaced":"video.inserted",[e,f])}else e=function(e,t,i){var o,r="";if(t&&void 0!==t)for(o in t)t.hasOwnProperty(o)&&"link"!=o&&(r+=" data-"+o+'="'+t[o]+'"');var s=p.opts.videoDefaultWidth;s&&"auto"!=s&&(s+="px");var n=G('<span contenteditable="false" draggable="true" class="fr-video fr-dv'+p.opts.videoDefaultDisplay[0]+("center"!=p.opts.videoDefaultAlign?" fr-fv"+p.opts.videoDefaultAlign[0]:"")+'"><video src="'+e+'" '+r+(s?' style="width: '+s+';" ':"")+" controls>"+p.language.translate("Your browser does not support HTML5 video.")+"</video></span>");n.toggleClass("fr-draggable",p.opts.videoMove),p.edit.on(),p.events.focus(!0),p.selection.restore(),p.undo.saveStep(),p.opts.videoSplitHTML?p.markers.split():p.markers.insert(),p.html.wrap();var a=p.$el.find(".fr-marker");return p.node.isLastSibling(a)&&a.parent().hasClass("fr-deletable")&&a.insertAfter(a.parent()),a.replaceWith(n),p.selection.clear(),n.find("video").get(0).readyState>n.find("video").get(0).HAVE_FUTURE_DATA||p.helpers.isIOS()?i.call(n.find("video").get(0)):n.find("video").on("canplaythrough load",i),n}(a,d,v),C(),p.undo.saveStep(),p.events.trigger("video.inserted",[e,f])}()}function c(e){var t=p.popups.get("video.insert");if(t||(t=n()),t.find(".fr-layer.fr-active").removeClass("fr-active").addClass("fr-pactive"),t.find(".fr-video-progress-bar-layer").addClass("fr-active"),t.find(".fr-buttons").hide(),N){var i=N.find("video");p.popups.setContainer("video.insert",p.$sc);var o=i.offset().left+i.width()/2,r=i.offset().top+i.height();p.popups.show("video.insert",o,r,i.outerHeight())}void 0===e&&h(p.language.translate("Uploading"),0)}function s(e){var t=p.popups.get("video.insert");if(t&&(t.find(".fr-layer.fr-pactive").addClass("fr-active").removeClass("fr-pactive"),t.find(".fr-video-progress-bar-layer").removeClass("fr-active"),t.find(".fr-buttons").show(),e||p.$el.find("video.fr-error").length)){if(p.events.focus(),p.$el.find("video.fr-error").length&&(p.$el.find("video.fr-error").parent().remove(),p.undo.saveStep(),p.undo.run(),p.undo.dropRedo()),!p.$wp&&N){var i=N;A(!0),p.selection.setAfter(i.find("video").get(0)),p.selection.restore()}p.popups.hide("video.insert")}}function h(e,t){var i=p.popups.get("video.insert");if(i){var o=i.find(".fr-video-progress-bar-layer");o.find("h3").text(e+(t?" "+t+"%":"")),o.removeClass("fr-error"),t?(o.find("div").removeClass("fr-indeterminate"),o.find("div > span").css("width",t+"%")):o.find("div").addClass("fr-indeterminate")}}function d(e){o.call(e.get(0))}function l(e){h("Loading video");var t=this.status,i=this.response,o=this.responseXML,r=this.responseText;try{if(p.opts.videoUploadToS3)if(201==t){var s=function(e){try{var t=G(e).find("Location").text(),i=G(e).find("Key").text();return!1===p.events.trigger("video.uploadedToS3",[t,i,e],!0)?(p.edit.on(),!1):t}catch(o){return D(K,e),!1}}(o);s&&a(s,!1,[],e,i||o)}else D(K,i||o);else if(200<=t&&t<300){var n=function(e){try{if(!1===p.events.trigger("video.uploaded",[e],!0))return p.edit.on(),!1;var t=JSON.parse(e);return t.link?t:(D(H,e),!1)}catch(i){return D(K,e),!1}}(r);n&&a(n.link,!1,n,e,i||r)}else D(X,i||r)}catch(P){D(K,i||r)}}function f(){D(K,this.response||this.responseText||this.responseXML)}function g(e){if(e.lengthComputable){var t=e.loaded/e.total*100|0;h(p.language.translate("Uploading"),t)}}function m(){p.edit.on(),s(!0)}function b(e){if(!p.core.sameInstance(M))return!0;e.preventDefault(),e.stopPropagation();var t=e.pageX||(e.originalEvent.touches?e.originalEvent.touches[0].pageX:null),i=e.pageY||(e.originalEvent.touches?e.originalEvent.touches[0].pageY:null);if(!t||!i)return!1;if("mousedown"==e.type){var o=p.$oel.get(0).ownerDocument,r=o.defaultView||o.parentWindow,s=!1;try{s=r.location!=r.parent.location&&!(r.$&&r.$.FE)}catch(n){}s&&r.frameElement&&(t+=p.helpers.getPX(G(r.frameElement).offset().left)+r.frameElement.clientLeft,i=e.clientY+p.helpers.getPX(G(r.frameElement).offset().top)+r.frameElement.clientTop)}p.undo.canDo()||p.undo.saveStep(),(T=G(this)).data("start-x",t),T.data("start-y",i),P.show(),p.popups.hideAll(),x()}function y(e){if(!p.core.sameInstance(M))return!0;if(T){e.preventDefault();var t=e.pageX||(e.originalEvent.touches?e.originalEvent.touches[0].pageX:null),i=e.pageY||(e.originalEvent.touches?e.originalEvent.touches[0].pageY:null);if(!t||!i)return!1;var o=T.data("start-x"),r=T.data("start-y");T.data("start-x",t),T.data("start-y",i);var s=t-o,n=i-r,a=N.find("iframe, embed, video"),d=a.width(),l=a.height();(T.hasClass("fr-hnw")||T.hasClass("fr-hsw"))&&(s=0-s),(T.hasClass("fr-hnw")||T.hasClass("fr-hne"))&&(n=0-n),a.css("width",d+s),a.css("height",l+n),a.removeAttr("width"),a.removeAttr("height"),_()}}function E(e){if(!p.core.sameInstance(M))return!0;T&&N&&(e&&e.stopPropagation(),T=null,P.hide(),_(),i(),p.undo.saveStep())}function t(e){return'<div class="fr-handler fr-h'+e+'"></div>'}function w(e,t,i,o){return e.pageX=t,e.pageY=t,b.call(this,e),e.pageX=e.pageX+i*Math.floor(Math.pow(1.1,o)),e.pageY=e.pageY+i*Math.floor(Math.pow(1.1,o)),y.call(this,e),E.call(this,e),++o}function C(){var e,t=Array.prototype.slice.call(p.el.querySelectorAll("video, .fr-video > *")),i=[];for(e=0;e<t.length;e++)i.push(t[e].getAttribute("src")),G(t[e]).toggleClass("fr-draggable",p.opts.videoMove),""===t[e].getAttribute("class")&&t[e].removeAttribute("class"),""===t[e].getAttribute("style")&&t[e].removeAttribute("style");if(V)for(e=0;e<V.length;e++)i.indexOf(V[e].getAttribute("src"))<0&&p.events.trigger("video.removed",[G(V[e])]);V=t}function _(){M||function(){var e;if(p.shared.$video_resizer?(M=p.shared.$video_resizer,P=p.shared.$vid_overlay,p.events.on("destroy",function(){M.removeClass("fr-active").appendTo(G("body:first"))},!0)):(p.shared.$video_resizer=G('<div class="fr-video-resizer"></div>'),M=p.shared.$video_resizer,p.events.$on(M,"mousedown",function(e){e.stopPropagation()},!0),p.opts.videoResize&&(M.append(t("nw")+t("ne")+t("sw")+t("se")),p.shared.$vid_overlay=G('<div class="fr-video-overlay"></div>'),P=p.shared.$vid_overlay,e=M.get(0).ownerDocument,G(e).find("body:first").append(P))),p.events.on("shared.destroy",function(){M.html("").removeData().remove(),M=null,p.opts.videoResize&&(P.remove(),P=null)},!0),p.helpers.isMobile()||p.events.$on(G(p.o_win),"resize.video",function(){A(!0)}),p.opts.videoResize){e=M.get(0).ownerDocument,p.events.$on(M,p._mousedown,".fr-handler",b),p.events.$on(G(e),p._mousemove,y),p.events.$on(G(e.defaultView||e.parentWindow),p._mouseup,E),p.events.$on(P,"mouseleave",E);var o=1,r=null,s=0;p.events.on("keydown",function(e){if(N){var t=-1!=navigator.userAgent.indexOf("Mac OS X")?e.metaKey:e.ctrlKey,i=e.which;(i!==r||200<e.timeStamp-s)&&(o=1),(i==G.FE.KEYCODE.EQUALS||p.browser.mozilla&&i==G.FE.KEYCODE.FF_EQUALS)&&t&&!e.altKey?o=w.call(this,e,1,1,o):(i==G.FE.KEYCODE.HYPHEN||p.browser.mozilla&&i==G.FE.KEYCODE.FF_HYPHEN)&&t&&!e.altKey&&(o=w.call(this,e,2,-1,o)),r=i,s=e.timeStamp}}),p.events.on("keyup",function(){o=1})}}(),(p.$wp||p.$sc).append(M),M.data("instance",p);var e=N.find("iframe, embed, video");M.css("top",(p.opts.iframe?e.offset().top-1:e.offset().top-p.$wp.offset().top-1)+p.$wp.scrollTop()).css("left",(p.opts.iframe?e.offset().left-1:e.offset().left-p.$wp.offset().left-1)+p.$wp.scrollLeft()).css("width",e.get(0).getBoundingClientRect().width).css("height",e.get(0).getBoundingClientRect().height).addClass("fr-active")}function o(e){if(e&&"touchend"==e.type&&Y)return!0;if(e&&p.edit.isDisabled())return e.stopPropagation(),e.preventDefault(),!1;if(p.edit.isDisabled())return!1;for(var t=0;t<G.FE.INSTANCES.length;t++)G.FE.INSTANCES[t]!=p&&G.FE.INSTANCES[t].events.trigger("video.hideResizer");p.toolbar.disable(),p.helpers.isMobile()&&(p.events.disableBlur(),p.$el.blur(),p.events.enableBlur()),p.$el.find(".fr-video.fr-active").removeClass("fr-active"),(N=G(this)).addClass("fr-active"),p.opts.iframe&&p.size.syncIframe(),L(),_(),i(),p.selection.clear(),p.button.bulkRefresh(),p.events.trigger("image.hideResizer")}function A(e){N&&(p.shared.vid_exit_flag||!0===e)&&(M.removeClass("fr-active"),p.toolbar.enable(),N.removeClass("fr-active"),N=null,x())}function e(){p.shared.vid_exit_flag=!0}function x(){p.shared.vid_exit_flag=!1}function S(e){var t=e.originalEvent.dataTransfer;if(t&&t.files&&t.files.length){var i=t.files[0];if(i&&i.type&&-1!==i.type.indexOf("video")){if(!p.opts.videoUpload)return e.preventDefault(),e.stopPropagation(),!1;p.markers.remove(),p.markers.insertAtPoint(e.originalEvent),p.$el.find(".fr-marker").replaceWith(G.FE.MARKERS),p.popups.hideAll();var o=p.popups.get("video.insert");return o||(o=n()),p.popups.setContainer("video.insert",p.$sc),p.popups.show("video.insert",e.originalEvent.pageX,e.originalEvent.pageY),c(),0<=p.opts.videoAllowedTypes.indexOf(i.type.replace(/video\//g,""))?R(t.files):D(j),e.preventDefault(),e.stopPropagation(),!1}}}function R(e){if(void 0!==e&&0<e.length){if(!1===p.events.trigger("video.beforeUpload",[e]))return!1;var t,i=e[0];if(i.size>p.opts.videoMaxSize)return D(W),!1;if(p.opts.videoAllowedTypes.indexOf(i.type.replace(/video\//g,""))<0)return D(j),!1;if(p.drag_support.formdata&&(t=p.drag_support.formdata?new FormData:null),t){var o;if(!1!==p.opts.videoUploadToS3)for(o in t.append("key",p.opts.videoUploadToS3.keyStart+(new Date).getTime()+"-"+(i.name||"untitled")),t.append("success_action_status","201"),t.append("X-Requested-With","xhr"),t.append("Content-Type",i.type),p.opts.videoUploadToS3.params)p.opts.videoUploadToS3.params.hasOwnProperty(o)&&t.append(o,p.opts.videoUploadToS3.params[o]);for(o in p.opts.videoUploadParams)p.opts.videoUploadParams.hasOwnProperty(o)&&t.append(o,p.opts.videoUploadParams[o]);t.append(p.opts.videoUploadParam,i);var r=p.opts.videoUploadURL;p.opts.videoUploadToS3&&(r=p.opts.videoUploadToS3.uploadURL?p.opts.videoUploadToS3.uploadURL:"https://"+p.opts.videoUploadToS3.region+".amazonaws.com/"+p.opts.videoUploadToS3.bucket);var s=p.core.getXHR(r,p.opts.videoUploadMethod);s.onload=function(){l.call(s,N)},s.onerror=f,s.upload.onprogress=g,s.onabort=m,c(),p.events.disableBlur(),p.edit.off(),p.events.enableBlur();var n=p.popups.get("video.insert");n&&n.off("abortUpload").on("abortUpload",function(){4!=s.readyState&&s.abort()}),s.send(t)}}}function D(e,t){p.edit.on(),N&&N.find("video").addClass("fr-error"),function(e){c();var t=p.popups.get("video.insert").find(".fr-video-progress-bar-layer");t.addClass("fr-error");var i=t.find("h3");i.text(e),p.events.disableBlur(),i.focus()}(p.language.translate("Something went wrong. Please try again.")),p.events.trigger("video.error",[{code:e,message:q[e]},t])}function U(){if(N){var e=p.popups.get("video.size"),t=N.find("iframe, embed, video");e.find('input[name="width"]').val(t.get(0).style.width||t.attr("width")).trigger("change"),e.find('input[name="height"]').val(t.get(0).style.height||t.attr("height")).trigger("change")}}function I(e){if(e)return p.popups.onRefresh("video.size",U),!0;var t={buttons:'<div class="fr-buttons">'+p.button.buildList(p.opts.videoSizeButtons)+"</div>",size_layer:'<div class="fr-video-size-layer fr-layer fr-active" id="fr-video-size-layer-'+p.id+'"><div class="fr-video-group"><div class="fr-input-line"><input id="fr-video-size-layer-width-'+p.id+'" type="text" name="width" placeholder="'+p.language.translate("Width")+'" tabIndex="1"></div><div class="fr-input-line"><input id="fr-video-size-layer-height-'+p.id+'" type="text" name="height" placeholder="'+p.language.translate("Height")+'" tabIndex="1"></div></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoSetSize" tabIndex="2" role="button">'+p.language.translate("Update")+"</button></div></div>"},i=p.popups.create("video.size",t);return p.events.$on(p.$wp,"scroll",function(){N&&p.popups.isVisible("video.size")&&(p.events.disableBlur(),d(N))}),i}function $(e){if(void 0===e&&(e=N),e){if(e.hasClass("fr-fvl"))return"left";if(e.hasClass("fr-fvr"))return"right";if(e.hasClass("fr-dvb")||e.hasClass("fr-dvi"))return"center";if("block"==e.css("display")){if("left"==e.css("text-algin"))return"left";if("right"==e.css("text-align"))return"right"}else{if("left"==e.css("float"))return"left";if("right"==e.css("float"))return"right"}}return"center"}function B(e){void 0===e&&(e=N);var t=e.css("float");return e.css("float","none"),"block"==e.css("display")?(e.css("float",""),e.css("float")!=t&&e.css("float",t),"block"):(e.css("float",""),e.css("float")!=t&&e.css("float",t),"inline")}function k(){if(N&&!1!==p.events.trigger("video.beforeRemove",[N])){var e=N;p.popups.hideAll(),A(!0),p.selection.setBefore(e.get(0))||p.selection.setAfter(e.get(0)),e.remove(),p.selection.restore(),p.html.fillEmptyBlocks(),p.events.trigger("video.removed",[e])}}function F(){s()}function O(e,t,i){!p.opts.htmlUntouched&&p.opts.useClasses?(e.removeClass("fr-fvl fr-fvr fr-dvb fr-dvi"),e.addClass("fr-fv"+i[0]+" fr-dv"+t[0])):"inline"==t?(e.css({display:"inline-block"}),"center"==i?e.css({"float":"none"}):"left"==i?e.css({"float":"left"}):e.css({"float":"right"})):(e.css({display:"block",clear:"both"}),"left"==i?e.css({textAlign:"left"}):"right"==i?e.css({textAlign:"right"}):e.css({textAlign:"center"}))}function z(){p.$el.find("video").filter(function(){return 0===G(this).parents("span.fr-video").length}).wrap('<span class="fr-video" contenteditable="false"></span>'),p.$el.find("embed, iframe").filter(function(){if(p.browser.safari&&this.getAttribute("src")&&this.setAttribute("src",this.src),0<G(this).parents("span.fr-video").length)return!1;for(var e=G(this).attr("src"),t=0;t<G.FE.VIDEO_PROVIDERS.length;t++){var i=G.FE.VIDEO_PROVIDERS[t];if(i.test_regex.test(e)&&new RegExp(p.opts.videoAllowedProviders.join("|")).test(i.provider))return!0}return!1}).map(function(){return 0===G(this).parents("object").length?this:G(this).parents("object").get(0)}).wrap('<span class="fr-video" contenteditable="false"></span>');for(var e,t,i=p.$el.find("span.fr-video, video"),o=0;o<i.length;o++){var r=G(i[o]);!p.opts.htmlUntouched&&p.opts.useClasses?((t=r).hasClass("fr-dvi")||t.hasClass("fr-dvb")||(t.addClass("fr-fv"+$(t)[0]),t.addClass("fr-dv"+B(t)[0])),p.opts.videoTextNear||r.removeClass("fr-dvi").addClass("fr-dvb")):p.opts.htmlUntouched||p.opts.useClasses||(O(e=r,e.hasClass("fr-dvb")?"block":e.hasClass("fr-dvi")?"inline":null,e.hasClass("fr-fvl")?"left":e.hasClass("fr-fvr")?"right":$(e)),e.removeClass("fr-dvb fr-dvi fr-fvr fr-fvl"))}i.toggleClass("fr-draggable",p.opts.videoMove)}function L(){if(N){p.selection.clear();var e=p.doc.createRange();e.selectNode(N.get(0)),p.selection.get().addRange(e)}}var P,T,M,N,V,Y,H=2,X=3,K=4,W=5,j=6,q={1:"Video cannot be loaded from the passed link."};return q[H]="No link in upload response.",q[X]="Error during file upload.",q[K]="Parsing response failed.",q[W]="File is too large.",q[j]="Video file type is invalid.",q[7]="Files can be uploaded only to same domain in IE 8 and IE 9.",p.shared.vid_exit_flag=!1,{_init:function(){p.events.on("drop",S,!0),p.events.on("mousedown window.mousedown",e),p.events.on("window.touchmove",x),p.events.on("mouseup window.mouseup",A),p.events.on("commands.mousedown",function(e){0<e.parents(".fr-toolbar").length&&A()}),p.events.on("video.hideResizer commands.undo commands.redo element.dropped",function(){A(!0)}),p.helpers.isMobile()&&(p.events.$on(p.$el,"touchstart","span.fr-video",function(){Y=!1}),p.events.$on(p.$el,"touchmove",function(){Y=!0})),p.events.on("html.set",z),z(),p.events.$on(p.$el,"mousedown","span.fr-video",function(e){e.stopPropagation()}),p.events.$on(p.$el,"click touchend","span.fr-video",function(e){if("false"==G(this).parents("[contenteditable]:not(.fr-element):not(.fr-img-caption):not(body):first").attr("contenteditable"))return!0;o.call(this,e)}),p.events.on("keydown",function(e){var t=e.which;return!N||t!=G.FE.KEYCODE.BACKSPACE&&t!=G.FE.KEYCODE.DELETE?N&&t==G.FE.KEYCODE.ESC?(A(!0),e.preventDefault(),!1):N&&t!=G.FE.KEYCODE.F10&&!p.keys.isBrowserAction(e)?(e.preventDefault(),!1):void 0:(e.preventDefault(),k(),p.undo.saveStep(),!1)},!0),p.events.on("toolbar.esc",function(){if(N)return p.events.disableBlur(),p.events.focus(),!1},!0),p.events.on("toolbar.focusEditor",function(){if(N)return!1},!0),p.events.on("keydown",function(){p.$el.find("span.fr-video:empty").remove()}),p.$wp&&(C(),p.events.on("contentChanged",C)),n(!0),I(!0)},showInsertPopup:function(){var e=p.$tb.find('.fr-command[data-cmd="insertVideo"]'),t=p.popups.get("video.insert");if(t||(t=n()),s(),!t.hasClass("fr-active"))if(p.popups.refresh("video.insert"),p.popups.setContainer("video.insert",p.$tb),e.is(":visible")){var i=e.offset().left+e.outerWidth()/2,o=e.offset().top+(p.opts.toolbarBottom?10:e.outerHeight()-10);p.popups.show("video.insert",i,o,e.outerHeight())}else p.position.forSelection(t),p.popups.show("video.insert")},showLayer:function(e){var t,i,o=p.popups.get("video.insert");if(!N&&!p.opts.toolbarInline){var r=p.$tb.find('.fr-command[data-cmd="insertVideo"]');t=r.offset().left+r.outerWidth()/2,i=r.offset().top+(p.opts.toolbarBottom?10:r.outerHeight()-10)}p.opts.toolbarInline&&(i=o.offset().top-p.helpers.getPX(o.css("margin-top")),o.hasClass("fr-above")&&(i+=o.outerHeight())),o.find(".fr-layer").removeClass("fr-active"),o.find(".fr-"+e+"-layer").addClass("fr-active"),p.popups.show("video.insert",t,i,0),p.accessibility.focusPopup(o)},refreshByURLButton:function(e){p.popups.get("video.insert").find(".fr-video-by-url-layer").hasClass("fr-active")&&e.addClass("fr-active").attr("aria-pressed",!0)},refreshEmbedButton:function(e){p.popups.get("video.insert").find(".fr-video-embed-layer").hasClass("fr-active")&&e.addClass("fr-active").attr("aria-pressed",!0)},refreshUploadButton:function(e){p.popups.get("video.insert").find(".fr-video-upload-layer").hasClass("fr-active")&&e.addClass("fr-active").attr("aria-pressed",!0)},upload:R,insertByURL:function(e){void 0===e&&(e=(p.popups.get("video.insert").find('.fr-video-by-url-layer input[type="text"]').val()||"").trim());var t=null;if(/^http/.test(e)||(e="https://"+e),p.helpers.isURL(e))for(var i=0;i<G.FE.VIDEO_PROVIDERS.length;i++){var o=G.FE.VIDEO_PROVIDERS[i];if(o.test_regex.test(e)&&new RegExp(p.opts.videoAllowedProviders.join("|")).test(o.provider)){t=e.replace(o.url_regex,o.url_text),t=o.html.replace(/\{url\}/,t);break}}t?r(t):p.events.trigger("video.linkError",[e])},insertEmbed:function(e){void 0===e&&(e=p.popups.get("video.insert").find(".fr-video-embed-layer textarea").val()||""),0!==e.length&&G.FE.VIDEO_EMBED_REGEX.test(e)?r(e):p.events.trigger("video.codeError",[e])},insert:r,align:function(e){N.removeClass("fr-fvr fr-fvl"),!p.opts.htmlUntouched&&p.opts.useClasses?"left"==e?N.addClass("fr-fvl"):"right"==e&&N.addClass("fr-fvr"):O(N,B(),e),L(),_(),i(),p.selection.clear()},refreshAlign:function(e){if(!N)return!1;e.find("> *:first").replaceWith(p.icon.create("video-align-"+$()))},refreshAlignOnShow:function(e,t){N&&t.find('.fr-command[data-param1="'+$()+'"]').addClass("fr-active").attr("aria-selected",!0)},display:function(e){N.removeClass("fr-dvi fr-dvb"),!p.opts.htmlUntouched&&p.opts.useClasses?"inline"==e?N.addClass("fr-dvi"):"block"==e&&N.addClass("fr-dvb"):O(N,e,$()),L(),_(),i(),p.selection.clear()},refreshDisplayOnShow:function(e,t){N&&t.find('.fr-command[data-param1="'+B()+'"]').addClass("fr-active").attr("aria-selected",!0)},remove:k,hideProgressBar:s,showSizePopup:function(){var e=p.popups.get("video.size");e||(e=I()),s(),p.popups.refresh("video.size"),p.popups.setContainer("video.size",p.$sc);var t=N.find("iframe, embed, video"),i=t.offset().left+t.width()/2,o=t.offset().top+t.height();p.popups.show("video.size",i,o,t.height())},replace:function(){var e=p.popups.get("video.insert");e||(e=n()),p.popups.isVisible("video.insert")||(s(),p.popups.refresh("video.insert"),p.popups.setContainer("video.insert",p.$sc));var t=N.offset().left+N.width()/2,i=N.offset().top+N.height();p.popups.show("video.insert",t,i,N.outerHeight())},back:function(){N?(p.events.disableBlur(),N.trigger("click")):(p.events.disableBlur(),p.selection.restore(),p.events.enableBlur(),p.popups.hide("video.insert"),p.toolbar.showInline())},setSize:function(e,t){if(N){var i=p.popups.get("video.size"),o=N.find("iframe, embed, video");o.css("width",e||i.find('input[name="width"]').val()),o.css("height",t||i.find('input[name="height"]').val()),o.get(0).style.width&&o.removeAttr("width"),o.get(0).style.height&&o.removeAttr("height"),i.find("input:focus").blur(),setTimeout(function(){N.trigger("click")},p.helpers.isAndroid()?50:0)}},get:function(){return N}}},G.FE.RegisterCommand("insertVideo",{title:"Insert Video",undo:!1,focus:!0,refreshAfterCallback:!1,popup:!0,callback:function(){this.popups.isVisible("video.insert")?(this.$el.find(".fr-marker").length&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("video.insert")):this.video.showInsertPopup()},plugin:"video"}),G.FE.DefineIcon("insertVideo",{NAME:"video-camera",FA5NAME:"camera"}),G.FE.DefineIcon("videoByURL",{NAME:"link"}),G.FE.RegisterCommand("videoByURL",{title:"By URL",undo:!1,focus:!1,toggle:!0,callback:function(){this.video.showLayer("video-by-url")},refresh:function(e){this.video.refreshByURLButton(e)}}),G.FE.DefineIcon("videoEmbed",{NAME:"code"}),G.FE.RegisterCommand("videoEmbed",{title:"Embedded Code",undo:!1,focus:!1,toggle:!0,callback:function(){this.video.showLayer("video-embed")},refresh:function(e){this.video.refreshEmbedButton(e)}}),G.FE.DefineIcon("videoUpload",{NAME:"upload"}),G.FE.RegisterCommand("videoUpload",{title:"Upload Video",undo:!1,focus:!1,toggle:!0,callback:function(){this.video.showLayer("video-upload")},refresh:function(e){this.video.refreshUploadButton(e)}}),G.FE.RegisterCommand("videoInsertByURL",{undo:!0,focus:!0,callback:function(){this.video.insertByURL()}}),G.FE.RegisterCommand("videoInsertEmbed",{undo:!0,focus:!0,callback:function(){this.video.insertEmbed()}}),G.FE.DefineIcon("videoDisplay",{NAME:"star"}),G.FE.RegisterCommand("videoDisplay",{title:"Display",type:"dropdown",options:{inline:"Inline",block:"Break Text"},callback:function(e,t){this.video.display(t)},refresh:function(e){this.opts.videoTextNear||e.addClass("fr-hidden")},refreshOnShow:function(e,t){this.video.refreshDisplayOnShow(e,t)}}),G.FE.DefineIcon("video-align",{NAME:"align-left"}),G.FE.DefineIcon("video-align-left",{NAME:"align-left"}),G.FE.DefineIcon("video-align-right",{NAME:"align-right"}),G.FE.DefineIcon("video-align-center",{NAME:"align-justify"}),G.FE.DefineIcon("videoAlign",{NAME:"align-center"}),G.FE.RegisterCommand("videoAlign",{type:"dropdown",title:"Align",options:{left:"Align Left",center:"None",right:"Align Right"},html:function(){var e='<ul class="fr-dropdown-list" role="presentation">',t=G.FE.COMMANDS.videoAlign.options;for(var i in t)t.hasOwnProperty(i)&&(e+='<li role="presentation"><a class="fr-command fr-title" tabIndex="-1" role="option" data-cmd="videoAlign" data-param1="'+i+'" title="'+this.language.translate(t[i])+'">'+this.icon.create("video-align-"+i)+'<span class="fr-sr-only">'+this.language.translate(t[i])+"</span></a></li>");return e+"</ul>"},callback:function(e,t){this.video.align(t)},refresh:function(e){this.video.refreshAlign(e)},refreshOnShow:function(e,t){this.video.refreshAlignOnShow(e,t)}}),G.FE.DefineIcon("videoReplace",{NAME:"exchange"}),G.FE.RegisterCommand("videoReplace",{title:"Replace",undo:!1,focus:!1,popup:!0,refreshAfterCallback:!1,callback:function(){this.video.replace()}}),G.FE.DefineIcon("videoRemove",{NAME:"trash"}),G.FE.RegisterCommand("videoRemove",{title:"Remove",callback:function(){this.video.remove()}}),G.FE.DefineIcon("videoSize",{NAME:"arrows-alt"}),G.FE.RegisterCommand("videoSize",{undo:!1,focus:!1,popup:!0,title:"Change Size",callback:function(){this.video.showSizePopup()}}),G.FE.DefineIcon("videoBack",{
NAME:"arrow-left"}),G.FE.RegisterCommand("videoBack",{title:"Back",undo:!1,focus:!1,back:!0,callback:function(){this.video.back()},refresh:function(e){this.video.get()||this.opts.toolbarInline?(e.removeClass("fr-hidden"),e.next(".fr-separator").removeClass("fr-hidden")):(e.addClass("fr-hidden"),e.next(".fr-separator").addClass("fr-hidden"))}}),G.FE.RegisterCommand("videoDismissError",{title:"OK",undo:!1,callback:function(){this.video.hideProgressBar(!0)}}),G.FE.RegisterCommand("videoSetSize",{undo:!0,focus:!1,title:"Update",refreshAfterCallback:!1,callback:function(){this.video.setSize()}})});