Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAGOU-0006Od-3F
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jan 2015 06:09:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YAGOR-0006GG-Ip
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 06:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YAGOQ-0006QY-Mc
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 06:09:15 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YAGOM-0006P3-Ff; Sun, 11 Jan 2015 06:09:10 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2B1F311810AB; Sun, 11 Jan 2015 12:09:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kTQ62m1VawZp; Sun, 11 Jan 2015 12:09:07 +0100 (CET)
Received: from [192.168.178.24] (p54ACA617.dip0.t-ipconnect.de [84.172.166.23])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	36BF611810AA; Sun, 11 Jan 2015 12:09:07 +0100 (CET)
Message-ID: <54B259D2.5020903@weilnetz.de>
Date: Sun, 11 Jan 2015 12:09:06 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel@redhat.com>, qemu-trivial@nongnu.org
References: <1420973811-21710-1-git-send-email-marcel@redhat.com>
In-Reply-To: <1420973811-21710-1-git-send-email-marcel@redhat.com>
Content-Type: text/html; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: fix some alignment
	issues
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
X-List-Received-Date: Sun, 11 Jan 2015 11:09:16 -0000

<html>
  <head>
    <meta content="text/html; charset=iso-8859-15"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 11.01.2015 um 11:56 schrieb Marcel
      Apfelbaum:<br>
    </div>
    <blockquote
      cite="mid:1420973811-21710-1-git-send-email-marcel@redhat.com"
      type="cite">
      <pre wrap="">The misalignment was caused by tabs which were used instead of spaces.

Signed-off-by: Marcel Apfelbaum <a class="moz-txt-link-rfc2396E" href="mailto:marcel@redhat.com">&lt;marcel@redhat.com&gt;</a>
---
v1 -&gt; v2:
 - Addressed Stefan Weil's comments:
   - Hunted all the tabs within the switch/main 

 vl.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

</pre>
    </blockquote>
    <br>
    Thanks.<br>
    <br>
    Reviewed-by: Stefan Weil <a class="moz-txt-link-rfc2396E" href="mailto:sw@weilnetz.de">&lt;sw@weilnetz.de&gt;</a><br>
    <br>
  </body>
</html>

