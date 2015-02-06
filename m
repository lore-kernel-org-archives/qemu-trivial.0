Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqYC-0002fV-Im
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:34:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YJqYB-0002f6-De
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YJqY8-0004By-4B
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:34:55 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:58672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YJqY7-0004Bq-Uu
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:34:52 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	AA76B1180041; Fri,  6 Feb 2015 22:34:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 0UVRhNv-CQfP; Fri,  6 Feb 2015 22:34:47 +0100 (CET)
Received: from [192.168.178.24] (p54AC902A.dip0.t-ipconnect.de [84.172.144.42])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	4EBB2118003F; Fri,  6 Feb 2015 22:34:47 +0100 (CET)
Message-ID: <54D53374.1050901@weilnetz.de>
Date: Fri, 06 Feb 2015 22:34:44 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
References: <1423255968-8624-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1423255968-8624-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: Amit Shah <amit.shah@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] migration: Fix warning caused by missing
 declaration of vmstate_dummy
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
X-List-Received-Date: Fri, 06 Feb 2015 21:34:56 -0000

Am 06.02.2015 um 21:52 schrieb Stefan Weil:
> Warning from the Sparse static analysis tool:
>
> stubs/vmstate.c:4:26: warning:
>   symbol 'vmstate_dummy' was not declared. Should it be static?
>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Amit Shah <amit.shah@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>

Sorry, I just noticed that I have sent several patches with a wrong 
mailing address qemu-devel@nongnug.org instead of qemu-devel@nongnu.org.
I'll resend those patches in a series with correct address.

Stefan


