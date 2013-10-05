Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSOI2-0006Kv-0L
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2013 05:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VSOHv-0006BY-Bo
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VSOHq-0001OQ-2K
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:36:39 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:38839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VSOHd-0001KH-52; Sat, 05 Oct 2013 05:36:21 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	855BF72819E0; Sat,  5 Oct 2013 11:36:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id XIBv8lbGA2Cc; Sat,  5 Oct 2013 11:36:18 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB5CB.dip0.t-ipconnect.de
	[84.173.181.203])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6B99B72809F0; Sat,  5 Oct 2013 11:36:18 +0200 (CEST)
Message-ID: <524FDD92.5000809@weilnetz.de>
Date: Sat, 05 Oct 2013 11:36:18 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
	<5249E4CD.1050605@weilnetz.de> <524C6DD0.9070605@msgid.tls.msk.ru>
	<524C80ED.3020507@weilnetz.de> <524D2745.8060906@redhat.com>
	<524FD8B2.9090201@msgid.tls.msk.ru>
	<524FD99E.8020205@msgid.tls.msk.ru>
In-Reply-To: <524FD99E.8020205@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Sat, 05 Oct 2013 09:36:44 -0000

Am 05.10.2013 11:19, schrieb Michael Tokarev:
>
> Author: Michael Tokarev <mjt@tls.msk.ru>
> Date:   Sat Oct 5 13:18:28 2013 +0400
>
>     migration: Fix compiler warning ('caps' may be used uninitialized)
>
>     Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>
> diff --git a/migration.c b/migration.c
> index b4f8462..2b1ab20 100644
> --- a/migration.c
> +++ b/migration.c
> @@ -150,6 +150,7 @@ MigrationCapabilityStatusList
> *qmp_query_migrate_capabilitie
>      MigrationState *s = migrate_get_current();
>      int i;
>
> +    caps = NULL; /* silence compiler warning */
>      for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
>          if (head == NULL) {
>              head = g_malloc0(sizeof(*caps));
>
>
> Thanks,
>
> /mjt
>


Reviewed-by: Stefan Weil <sw@weilnetz.de>


