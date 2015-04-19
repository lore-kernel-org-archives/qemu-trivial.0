Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YjmrA-0001Ex-EP
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 06:53:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr7-0001AH-HD
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr3-0005mO-Em
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:41 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:37864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr3-0005lJ-8G
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:37 -0400
Received: by widdi4 with SMTP id di4so62301957wid.0
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 03:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ud3hYqFl6PA1T54eTD/hemMLLEj/FoCUEFKB8bVuPNM=;
	b=KjyByZp0yIyhnt3AB5k/XBM2UnDpCMQNNQqyshVLdJH7atVq8ACMlISVwvlKr3odnM
	hnSdP3GXHbea5CswNIjdGaHSE0RnP6lmsV78gGTW/6dtGHLRxhb00xBjTzXS61yTbRNg
	VYLUM4ZU/98jMyeojNmqCn20iu9TvfW6xCt1gPb3U5tcVS2xNQBdllQsqsmmePCyWg1s
	0wsocPDCRYnfi5aXplm/3ANtOj0HYPqmvBY1nV73UNcJTK71kypO2jHIoixrG4jtPbSq
	vqwpUaDlqXWJ/keSwCoK1oHeMb4mD74lEbqu3VydrdXSuwD36RyvBmUfzk87wZZ2GYSV
	4fjw==
X-Gm-Message-State: ALoCoQlaQ040mSOS0zISNcJtxrraeMKsVUU1gWw7Ed0U/It4A9Z03XPhbEt/EVSyLzap5GfMZCm9
X-Received: by 10.180.104.34 with SMTP id gb2mr15689364wib.95.1429440816687;
	Sun, 19 Apr 2015 03:53:36 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id fv2sm4350546wjb.6.2015.04.19.03.53.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Apr 2015 03:53:36 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 Apr 2015 13:53:16 +0300
Message-Id: <1429440798-11888-4-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
References: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH 2/4] qemu-ga: debug printout to help
	troubleshoot installation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Apr 2015 10:53:42 -0000

Debug printout extended, helps installation troubleshooting

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 qga/channel-win32.c  | 2 +-
 qga/commands-win32.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index 0d5e5f5..04fa5e4 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -306,7 +306,7 @@ static gboolean ga_channel_open(GAChannel *c, GAChannelMethod method,
                            OPEN_EXISTING,
                            FILE_FLAG_NO_BUFFERING | FILE_FLAG_OVERLAPPED, NULL);
     if (c->handle == INVALID_HANDLE_VALUE) {
-        g_critical("error opening path");
+        g_critical("error opening path %s", newpath);
         return false;
     }
 
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3ef0549..d0aaec7 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -721,6 +721,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
     }
 
     if (!vss_init(true)) {
+        g_debug("vss_init failed, vss commands are going to be disabled");
         const char *list[] = {
             "guest-get-fsinfo", "guest-fsfreeze-status",
             "guest-fsfreeze-freeze", "guest-fsfreeze-thaw", NULL};
-- 
2.1.0


