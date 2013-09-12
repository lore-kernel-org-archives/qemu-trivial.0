Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKC7U-0006aV-B3
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 15:00:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKC7M-0006aK-D5
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKC7F-00078K-3W
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:59:52 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:52798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKC7E-00078F-Tz
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:59:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	96CDA72819E9; Thu, 12 Sep 2013 20:59:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id f0FrQmnlzFbC; Thu, 12 Sep 2013 20:59:32 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB00D.dip0.t-ipconnect.de [84.173.176.13])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9F2A672819E4; Thu, 12 Sep 2013 20:59:32 +0200 (CEST)
Message-ID: <52320F14.7010405@weilnetz.de>
Date: Thu, 12 Sep 2013 20:59:32 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1379008635-17714-1-git-send-email-sw@weilnetz.de>
	<5232074D.7050606@redhat.com>
In-Reply-To: <5232074D.7050606@redhat.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] *-user: Improve
 documentation for lock_user function
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
X-List-Received-Date: Thu, 12 Sep 2013 18:59:59 -0000

Am 12.09.2013 20:26, schrieb Eric Blake:
> On 09/12/2013 11:57 AM, Stefan Weil wrote:
>> Add a missing "function" and replace "and" by "any".
>> BSD und Linux use the same documentation here, so fix both.
>
> s/und/and/

Indeed, thanks. Well, I am German, so I may write "und". :-)

Perhaps this can be fixed when the patch is added to qemu-trivial,
or I send an update, or we leave it as it is to document that I not
only fix typos, but also add new ones. ;-)

Stefan



