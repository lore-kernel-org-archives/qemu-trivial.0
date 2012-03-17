Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8w3V-0001TO-6P
	for mharc-qemu-trivial@gnu.org; Sat, 17 Mar 2012 12:00:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S8w3L-00010R-1d
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 12:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S8w2r-0007oF-5x
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 12:00:22 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S8w2n-0007n8-JS; Sat, 17 Mar 2012 11:59:49 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9506472800A1; Sat, 17 Mar 2012 16:59:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id xz-2feFLqAXV; Sat, 17 Mar 2012 16:59:47 +0100 (CET)
Received: from [192.168.178.20] (p54ADA949.dip.t-dialin.net [84.173.169.73])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1530F72800A0; Sat, 17 Mar 2012 16:59:47 +0100 (CET)
Message-ID: <4F64B4F2.5020805@weilnetz.de>
Date: Sat, 17 Mar 2012 16:59:46 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1331998306-30941-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA89CWS=+N1JPXo=o-sR9sAxBg4X+AZGb47UdzdWCTjy2A@mail.gmail.com>
In-Reply-To: <CAFEAcA89CWS=+N1JPXo=o-sR9sAxBg4X+AZGb47UdzdWCTjy2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Fix creation of
 symbolic links for MinGW toolchain
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
X-List-Received-Date: Sat, 17 Mar 2012 16:00:31 -0000

Am 17.03.2012 16:49, schrieb Peter Maydell:
> On 17 March 2012 15:31, Stefan Weil<sw@weilnetz.de>  wrote:
>> Macro symlink is also used with directories. To remove them on w32
>> hosts, a recursive rm is needed.
> Where do we symlink directories? (I exclude the setting up
> of the linux headers because that will only happen on Linux
> hosts where we know we have working symlinks.)
>
> -- PMM

pc-bios/keymaps

Cheers,
Stefan W.


