Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPG1I-0001RT-Mc
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 14:42:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WPG19-0001Fr-SS
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WPG13-0006b7-NP
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:42:39 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:58158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WPG0q-0006WR-2o; Sun, 16 Mar 2014 14:42:20 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1548972800DC; Sun, 16 Mar 2014 19:42:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 5JsoxJJmhZLs; Sun, 16 Mar 2014 19:42:07 +0100 (CET)
Received: from [192.168.178.35] (p54ADBC56.dip0.t-ipconnect.de [84.173.188.86])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3641B72800B7; Sun, 16 Mar 2014 19:42:07 +0100 (CET)
Message-ID: <5325F07C.80004@weilnetz.de>
Date: Sun, 16 Mar 2014 19:42:04 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org
References: <1394992972-23004-1-git-send-email-sw@weilnetz.de>
	<5325E841.3080508@twiddle.net>
In-Reply-To: <5325E841.3080508@twiddle.net>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util: Add 'static'
 attribute to function implementation
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
X-List-Received-Date: Sun, 16 Mar 2014 18:42:46 -0000

Am 16.03.2014 19:06, schrieb Richard Henderson:
> On 03/16/2014 11:02 AM, Stefan Weil wrote:
>> 'static' is used in the forward declaration, but not in the implementation.
>> Add it there, too.
> 
> You might consider reporting this as a bug in the analyzer, since the static in
> the forward declaration does apply to the definition.
> 
> That said, for style it's usually better to make them match, so,
> 
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Yes, the forward declaration applies here. IMHO it helps human reviewers
if they can see directly that some function is only local, therefore I
prefer the attribute 'static' at both code locations.

We have a similar situation with other attributes, too. Smatch also
complains about missing QEMU_NORETURN in our implementation code (we add
it only in header files for global functions). Do you think it would be
good to make header and implementation match there, too?

Stefan



