Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zf0nV-0008G3-F7
	for mharc-qemu-trivial@gnu.org; Thu, 24 Sep 2015 03:18:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Zf0nO-00087f-KC
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 03:18:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Zf0nL-0000Yv-DX
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 03:18:22 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:43323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Zf0nL-0000Ya-7c
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 03:18:19 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D683411810AD; Thu, 24 Sep 2015 09:18:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TAoeEsstzoue; Thu, 24 Sep 2015 09:18:14 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (mobile-195-224.wlan.uni-mannheim.de
	[134.155.195.224])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	29D4B11810A3; Thu, 24 Sep 2015 09:18:13 +0200 (CEST)
Message-ID: <5603A3B4.1020900@weilnetz.de>
Date: Thu, 24 Sep 2015 09:18:12 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1442231583-23535-1-git-send-email-armbru@redhat.com>
	<87h9mkthx7.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9mkthx7.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: riku.voipio@iki.fi
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Use g_new() &
 friends where that makes obvious sense
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
X-List-Received-Date: Thu, 24 Sep 2015 07:18:28 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Am 24.09.2015 um 09:06 schrieb Markus Armbruster:
> Ping?
> 
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also 
>> safer, for two reasons.  One, it catches multiplication 
>> overflowing size_t. Two, it returns T * rather than void *,
>> which lets the compiler catch more type errors.
>> 
>> This commit only touches allocations with size arguments of the 
>> form sizeof(T).  Same Coccinelle semantic patchas in commit 
>> b45c03f.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com> --- 
>> linux-user/elfload.c | 2 +- linux-user/main.c    | 2 +- 
>> linux-user/syscall.c | 2 +- 3 files changed, 3 insertions(+), 3 
>> deletions(-)

Reviewed-by: Stefan Weil <sw@weilnetz.de>

This patch is trivial enough for qemu-trivial.

As Eric has written, the commit message needs
a small correction: s/patchas/patch as/

Regards
Stefan

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWA6OuAAoJEOCMIdVndFCt6Q8P/R6kKihtOvr17lL3Av117n1z
YPv6Tfa9jy1fd3qaeIMhXgm63CNTWTGU4o0A9/k3thqiD9kYVpqeZkd7gt1gE6uU
QR/eReEMZNr+5AnkYnCmZ8wr5upd4RWUjCvbGSUpFgb1ui+VtwZ08XzCVehQfY39
2S6EWxR/I7ETxzue+AFZak9w4QqVF7IQmw7CPkeTCD/himdCpyeGxL9dYQnyfEdW
mQeXUR2eipaqwIt1b6JkwQCU78rY2D/OLVDipZK9M4BSmJQWS2BsLboc+VC59bN9
JkVrKgSbuciqBMXDudY71qv9XO/wyM8MwnDM5GY7V9N1PoRVcg2mvSCRKq9lP82K
V0Sb6n1j9/AgM3ngnLZqkiVYkeFrnccIkiKCJvmDnDP1ClC8Cy5V1wkPzk7TJgTK
4xvuI3kfWPIzbphWzZtcCstJKYaO5ydrEGGNGko37A6s65oE+gIhyrv/KSIhix+H
n7KMOILY4wuk7UYoIgK6cvKL6QsVyhw0lR+RIR8p33ofAj20HylQng38h6spr50F
XTl3J38ApbyxNhw+EJHXXwj14YJFrZTwN8C0X49UHkSD4wqR4lH+2kdNUYIYJJHR
Zx+HkJj/8hLQq14WjtgZlNQ7noAck/yh9Rvyu54v6yfx1RAhNkDbiysQKgqkWzNM
U5ro2khoY2BrI7Bdq29H
=/Z+4
-----END PGP SIGNATURE-----

