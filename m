Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WwBU2-0002IM-CT
	for mharc-qemu-trivial@gnu.org; Sun, 15 Jun 2014 10:32:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WwBTu-00029m-HR
	for qemu-trivial@nongnu.org; Sun, 15 Jun 2014 10:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WwBTo-0007g8-GB
	for qemu-trivial@nongnu.org; Sun, 15 Jun 2014 10:32:26 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:41725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WwBTc-0007ZP-1O; Sun, 15 Jun 2014 10:32:08 -0400
Received: by mail-wg0-f41.google.com with SMTP id a1so4589999wgh.12
	for <multiple recipients>; Sun, 15 Jun 2014 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b1awBy6yWOGLYFDduO2AvfqN+bGF+cuXrkJKCe0niNA=;
	b=yFFGIXyffsYWJcP1bNq5in9KOEX/vnlncJaTy1lAB8PK+6DIMcBS/ardqGWwl4im4k
	L9w2z9zqgwGKpfXnKaHHTtyMcXL9MmOtHj9CaMGV4zcrbcD+eQ8jAqvogg5uGIoR3T1Q
	X8SKP/FUQnWspqiQQAhgP9SxRJeWQKia4GwtTnIPSYEtYmvoQWnXYymYY3PRulpr1OuB
	7QW6qj8b+9KZuapsC03wOM9UGSX5fKW0UYyJBlwstbaW7+4SMkr6jHxh/hpeGn0jbWYg
	mkr6RklfMXJNsZJB+sRd0MXQhVqNQ3Fh4mu4KQqnzd6GGRqhT1bdzG9NckFSQZ2Qb5qb
	WJPw==
X-Received: by 10.180.105.72 with SMTP id gk8mr19711325wib.32.1402842727097;
	Sun, 15 Jun 2014 07:32:07 -0700 (PDT)
Received: from Inspiron-3521 ([41.103.8.66])
	by mx.google.com with ESMTPSA id u10sm8946381wix.11.2014.06.15.07.32.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 15 Jun 2014 07:32:06 -0700 (PDT)
Date: Sun, 15 Jun 2014 15:32:01 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20140615143201.GA5854@Inspiron-3521>
References: <1402826636-12435-1-git-send-email-kroosec@gmail.com>
	<539DA65A.6020800@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <539DA65A.6020800@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] watchdog: Export watchdog actions list.
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
X-List-Received-Date: Sun, 15 Jun 2014 14:32:32 -0000

On Sun, Jun 15, 2014 at 03:57:46PM +0200, Paolo Bonzini wrote:
> Il 15/06/2014 12:03, Hani Benhabiles ha scritto:
> >Also, use it instead of using hard-coded values.
> >
> >Signed-off-by: Hani Benhabiles <hani@linux.com>
> >---
> >Should have been part of the last monitor completion series, but better late
> >then never. :)
> >
> > hw/watchdog/watchdog.c    | 35 +++++++++++++++++++----------------
> > include/sysemu/watchdog.h |  6 ++++++
> > monitor.c                 | 19 ++++++++++++-------
> > 3 files changed, 37 insertions(+), 23 deletions(-)
> >
> >diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
> >index f28161b..3bea6fe 100644
> >--- a/hw/watchdog/watchdog.c
> >+++ b/hw/watchdog/watchdog.c
> >@@ -39,6 +39,16 @@
> > static int watchdog_action = WDT_RESET;
> > static QLIST_HEAD(watchdog_list, WatchdogTimerModel) watchdog_list;
> >
> >+struct watchdog_action watchdog_actions[] = {
> >+    { "reset",  WDT_RESET },
> >+    { "shutdown", WDT_SHUTDOWN },
> >+    { "poweroff", WDT_POWEROFF },
> >+    { "pause", WDT_PAUSE },
> >+    { "debug", WDT_DEBUG },
> >+    { "none", WDT_NONE },
> >+    { NULL, 0 },
> >+};
> 
> The QAPI event series instead used a QAPI enum and renamed this to something
> like WATCHDOG_ACTION_{RESET,SHUTDOWN,...} at the same time.
> 
> I guess we can wait for those patches to go in.

Sounds alright to me. Will wait for them.

> 
> Paolo
> 
> > void watchdog_add_model(WatchdogTimerModel *model)
> > {
> >     QLIST_INSERT_HEAD(&watchdog_list, model, entry);
> >@@ -83,22 +93,15 @@ int select_watchdog(const char *p)
> >
> > int select_watchdog_action(const char *p)
> > {
> >-    if (strcasecmp(p, "reset") == 0)
> >-        watchdog_action = WDT_RESET;
> >-    else if (strcasecmp(p, "shutdown") == 0)
> >-        watchdog_action = WDT_SHUTDOWN;
> >-    else if (strcasecmp(p, "poweroff") == 0)
> >-        watchdog_action = WDT_POWEROFF;
> >-    else if (strcasecmp(p, "pause") == 0)
> >-        watchdog_action = WDT_PAUSE;
> >-    else if (strcasecmp(p, "debug") == 0)
> >-        watchdog_action = WDT_DEBUG;
> >-    else if (strcasecmp(p, "none") == 0)
> >-        watchdog_action = WDT_NONE;
> >-    else
> >-        return -1;
> >-
> >-    return 0;
> >+    int i;
> >+
> >+    for (i = 0; watchdog_actions[i].name; i++) {
> >+        if (!strcasecmp(p, watchdog_actions[i].name)) {
> >+            watchdog_action = watchdog_actions[i].action;
> >+            return 0;
> >+        }
> >+    }
> >+    return -1;
> > }
> >
> > static void watchdog_mon_event(const char *action)
> >diff --git a/include/sysemu/watchdog.h b/include/sysemu/watchdog.h
> >index 3e9a970..2bfe2fc 100644
> >--- a/include/sysemu/watchdog.h
> >+++ b/include/sysemu/watchdog.h
> >@@ -34,6 +34,12 @@ struct WatchdogTimerModel {
> > };
> > typedef struct WatchdogTimerModel WatchdogTimerModel;
> >
> >+struct watchdog_action {
> >+    const char *name;
> >+    int action;
> >+};
> >+extern struct watchdog_action watchdog_actions[];
> >+
> > /* in hw/watchdog.c */
> > int select_watchdog(const char *p);
> > int select_watchdog_action(const char *action);
> >diff --git a/monitor.c b/monitor.c
> >index ee9390f..57d23c6 100644
> >--- a/monitor.c
> >+++ b/monitor.c
> >@@ -4562,16 +4562,21 @@ void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
> >
> > void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
> > {
> >+    int i;
> >+    size_t len;
> >+
> >     if (nb_args != 2) {
> >         return;
> >     }
> >-    readline_set_completion_index(rs, strlen(str));
> >-    add_completion_option(rs, str, "reset");
> >-    add_completion_option(rs, str, "shutdown");
> >-    add_completion_option(rs, str, "poweroff");
> >-    add_completion_option(rs, str, "pause");
> >-    add_completion_option(rs, str, "debug");
> >-    add_completion_option(rs, str, "none");
> >+    len = strlen(str);
> >+    readline_set_completion_index(rs, len);
> >+    for (i = 0; watchdog_actions[i].name; i++) {
> >+        const char *name = watchdog_actions[i].name;
> >+
> >+        if (!strncmp(str, name, len)) {
> >+            readline_add_completion(rs, name);
> >+        }
> >+    }
> > }
> >
> > void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
> >
> 

