Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVqKP-0001HE-TF
	for mharc-qemu-trivial@gnu.org; Wed, 30 Nov 2011 15:00:25 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RVqKL-00011j-9e
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 15:00:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RVqKH-0004Uv-8m
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 15:00:21 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RVqKE-0004UC-Sv; Wed, 30 Nov 2011 15:00:14 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	703D0728188C; Wed, 30 Nov 2011 21:00:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1uNZoWYpTQqe; Wed, 30 Nov 2011 20:59:32 +0100 (CET)
Received: from [192.168.178.20] (p54ADA6C5.dip.t-dialin.net [84.173.166.197])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	0755C728188A; Wed, 30 Nov 2011 20:59:32 +0100 (CET)
Message-ID: <4ED68B19.7050704@weilnetz.de>
Date: Wed, 30 Nov 2011 20:59:21 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <4ED3F1C3.4060601@weilnetz.de>	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>	<CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
	<alpine.DEB.2.00.1111301227570.31179@kaball-desktop>
In-Reply-To: <alpine.DEB.2.00.1111301227570.31179@kaball-desktop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Makefile: use full path
 for qapi-generated directory
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
X-List-Received-Date: Wed, 30 Nov 2011 20:00:22 -0000

Am 30.11.2011 14:03, schrieb Stefano Stabellini:
> On Wed, 30 Nov 2011, Stefan Hajnoczi wrote:
>> On Tue, Nov 29, 2011 at 10:47 PM, Michael Roth
>> <mdroth@linux.vnet.ibm.com> wrote:
>>> Generally $(BUILD_DIR) =3D=3D $(CURDIR), but that isn't necessarilly =
the
>>> case, so use $(BUILD_DIR)/qapi-generated for generated files to
>>> avoid potentionally sticking generating files in odd places outside
>>> the build's include paths.
>>> ---
>>> =C3=83?=C3=82=C2 Makefile | =C3=83?=C3=82=C2 =C3=83?=C3=82=C2 2 +-
>>> =C3=83?=C3=82=C2 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
>>
>> Not applied to trivial tree yet. I want to let Stefano, Stefan Weil,
>> or Anthony take a look too since we were all discussing these changes
>> yesterday.
>
> While I think that the change is correct (certainly better than the
> original patch), unfortunately still doesn't solve the problem
> entirely.
> Steps to repro, assuming "qemu" is the source tree and "temp" is the
> empty build directory:
>
> - cd qemu; ./configure; make
>
> - cd ../temp; ./configure --source-path=3D../qemu; make
>
> Result:
>
> Makefile:9: config-devices.mak: No such file or directory
>
> In order to fix the issue, we need to make sure that config-devices.mak
> is relative to $(BUILD_DIR) in the Makefile.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>
> diff --git a/Makefile b/Makefile
[snip]

It's common to use either out-of-tree builds or in-tree builds,
but not to mix both variants with a common root directory.
I think QEMU should explicitly forbid that mixed scenario (like
other projects do).

Even with your fix there can remain problems with generated
header files. The mixed scenario creates unnecessary complexity.
Without the mixed scenario, your patch is not needed.

Regards,
Stefan Weil


