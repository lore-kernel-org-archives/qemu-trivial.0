Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WwAwu-0004HR-25
	for mharc-qemu-trivial@gnu.org; Sun, 15 Jun 2014 09:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WwAwl-00044c-MM
	for qemu-trivial@nongnu.org; Sun, 15 Jun 2014 09:58:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WwAwf-0004dx-ML
	for qemu-trivial@nongnu.org; Sun, 15 Jun 2014 09:58:11 -0400
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:45125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WwAwS-0004Vl-Sy; Sun, 15 Jun 2014 09:57:53 -0400
Received: by mail-wg0-f42.google.com with SMTP id z12so4418335wgg.1
	for <multiple recipients>; Sun, 15 Jun 2014 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+52W4iQTqJiZ1DvTrlnycx1Kl79VygEIHz+xo/dJGBk=;
	b=VGlIvFhuv+FEdyjapqVeYfqNEd8qLIh4co8qrSEm+gjP9B7NtXt16bC70Qrh/ijAPS
	k1aaxEc9PP7BDuQhZ0mXS1BlCNNf9zOtll/fXU9FSAGgpVx1PWSpm81dKRcp1FK6tAyF
	ZopypWnW9Rjr6sm4wrDO2Awl8InMu76NkERX81IC6I+kWmmSQpt3PkKqcAIeU1EOGK2K
	Tx7N458N2/cmSOD7y52o4mVOH0cJThk/jP6WVWF7nHBZFbJB4KWETzuuot0yXbiJpM6D
	bowBldDsqNtd65ZINEzPWXr53EFsN1MFWdx7VTvIpSXkLEe2A9Jp9sdSqhNb/d7G4y4p
	FK1A==
X-Received: by 10.180.37.100 with SMTP id x4mr19770000wij.37.1402840671724;
	Sun, 15 Jun 2014 06:57:51 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-140-88.cust.vodafonedsl.it.
	[37.117.140.88]) by mx.google.com with ESMTPSA id
	j44sm26776110eeg.30.2014.06.15.06.57.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Jun 2014 06:57:50 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <539DA65A.6020800@redhat.com>
Date: Sun, 15 Jun 2014 15:57:46 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1402826636-12435-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1402826636-12435-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
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
X-List-Received-Date: Sun, 15 Jun 2014 13:58:17 -0000

Il 15/06/2014 12:03, Hani Benhabiles ha scritto:
> Also, use it instead of using hard-coded values.
>
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
> Should have been part of the last monitor completion series, but better late
> then never. :)
>
>  hw/watchdog/watchdog.c    | 35 +++++++++++++++++++----------------
>  include/sysemu/watchdog.h |  6 ++++++
>  monitor.c                 | 19 ++++++++++++-------
>  3 files changed, 37 insertions(+), 23 deletions(-)
>
> diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
> index f28161b..3bea6fe 100644
> --- a/hw/watchdog/watchdog.c
> +++ b/hw/watchdog/watchdog.c
> @@ -39,6 +39,16 @@
>  static int watchdog_action = WDT_RESET;
>  static QLIST_HEAD(watchdog_list, WatchdogTimerModel) watchdog_list;
>
> +struct watchdog_action watchdog_actions[] = {
> +    { "reset",  WDT_RESET },
> +    { "shutdown", WDT_SHUTDOWN },
> +    { "poweroff", WDT_POWEROFF },
> +    { "pause", WDT_PAUSE },
> +    { "debug", WDT_DEBUG },
> +    { "none", WDT_NONE },
> +    { NULL, 0 },
> +};

The QAPI event series instead used a QAPI enum and renamed this to 
something like WATCHDOG_ACTION_{RESET,SHUTDOWN,...} at the same time.

I guess we can wait for those patches to go in.

Paolo

>  void watchdog_add_model(WatchdogTimerModel *model)
>  {
>      QLIST_INSERT_HEAD(&watchdog_list, model, entry);
> @@ -83,22 +93,15 @@ int select_watchdog(const char *p)
>
>  int select_watchdog_action(const char *p)
>  {
> -    if (strcasecmp(p, "reset") == 0)
> -        watchdog_action = WDT_RESET;
> -    else if (strcasecmp(p, "shutdown") == 0)
> -        watchdog_action = WDT_SHUTDOWN;
> -    else if (strcasecmp(p, "poweroff") == 0)
> -        watchdog_action = WDT_POWEROFF;
> -    else if (strcasecmp(p, "pause") == 0)
> -        watchdog_action = WDT_PAUSE;
> -    else if (strcasecmp(p, "debug") == 0)
> -        watchdog_action = WDT_DEBUG;
> -    else if (strcasecmp(p, "none") == 0)
> -        watchdog_action = WDT_NONE;
> -    else
> -        return -1;
> -
> -    return 0;
> +    int i;
> +
> +    for (i = 0; watchdog_actions[i].name; i++) {
> +        if (!strcasecmp(p, watchdog_actions[i].name)) {
> +            watchdog_action = watchdog_actions[i].action;
> +            return 0;
> +        }
> +    }
> +    return -1;
>  }
>
>  static void watchdog_mon_event(const char *action)
> diff --git a/include/sysemu/watchdog.h b/include/sysemu/watchdog.h
> index 3e9a970..2bfe2fc 100644
> --- a/include/sysemu/watchdog.h
> +++ b/include/sysemu/watchdog.h
> @@ -34,6 +34,12 @@ struct WatchdogTimerModel {
>  };
>  typedef struct WatchdogTimerModel WatchdogTimerModel;
>
> +struct watchdog_action {
> +    const char *name;
> +    int action;
> +};
> +extern struct watchdog_action watchdog_actions[];
> +
>  /* in hw/watchdog.c */
>  int select_watchdog(const char *p);
>  int select_watchdog_action(const char *action);
> diff --git a/monitor.c b/monitor.c
> index ee9390f..57d23c6 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4562,16 +4562,21 @@ void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
>
>  void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
>  {
> +    int i;
> +    size_t len;
> +
>      if (nb_args != 2) {
>          return;
>      }
> -    readline_set_completion_index(rs, strlen(str));
> -    add_completion_option(rs, str, "reset");
> -    add_completion_option(rs, str, "shutdown");
> -    add_completion_option(rs, str, "poweroff");
> -    add_completion_option(rs, str, "pause");
> -    add_completion_option(rs, str, "debug");
> -    add_completion_option(rs, str, "none");
> +    len = strlen(str);
> +    readline_set_completion_index(rs, len);
> +    for (i = 0; watchdog_actions[i].name; i++) {
> +        const char *name = watchdog_actions[i].name;
> +
> +        if (!strncmp(str, name, len)) {
> +            readline_add_completion(rs, name);
> +        }
> +    }
>  }
>
>  void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
>


