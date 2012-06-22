Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si12R-0002wg-LD
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 06:24:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Si12J-0002qd-Cl
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 06:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Si12G-0000G6-T7
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 06:24:18 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:65161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Si12G-0000FA-LS
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 06:24:16 -0400
Received: by bkwj10 with SMTP id j10so1498891bkw.4
	for <qemu-trivial@nongnu.org>; Fri, 22 Jun 2012 03:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=+1YSrNmle84eGyPGM+kCEPnYrXLB0CF3DaJ0XZ2afD4=;
	b=BccTaFroRdS/bTPpQoGmJbfaMPDCb3ugQ7rfCb7Od8MC0/uA6D9ktrbnnsPm0NoWA+
	eOtn9+WwW+MLzCx7uUJhi5srObz3gSxsKb54Q5gqm4ZiHEeuYF9AyK+GO911QlzrFbwa
	sO2Si8fhEEE64DbovNyuvPhJDtLIfmDtD/xgzxrJKXOQ6aNa7y1RYrvcluOCpqSOk/kP
	xsIwAlzdvw1/I0D1tW8kZ18epjUZkGRi4AX5RssXb7IBCDTHESbUEECdI41VtWaQjNkg
	vFfP38gNdn/uBpfw+M/r8COcGiFWTtBE0OOPaXrmMyZZdUyG87Ijus89Ji0EndLdoQRr
	Gy2w==
MIME-Version: 1.0
Received: by 10.204.155.131 with SMTP id s3mr543348bkw.124.1340360653943; Fri,
	22 Jun 2012 03:24:13 -0700 (PDT)
Received: by 10.204.119.199 with HTTP; Fri, 22 Jun 2012 03:24:13 -0700 (PDT)
In-Reply-To: <20120622091555.GF27038@stefanha-thinkpad.localdomain>
References: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
	<20120622091555.GF27038@stefanha-thinkpad.localdomain>
Date: Fri, 22 Jun 2012 20:24:13 +1000
Message-ID: <CAEgOgz6PNWM9=zFMk9PjnrWy5YbZ84cxHV1=HuzAioGP8Oa62g@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQlorGypRogLwr84/w1tAZdyxsv4YPh5CscrpS6UYn9zLueocSW+0RGAH/LRv95BSqx+QXtT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
	john.williams@petalogix.com
Subject: Re: [Qemu-trivial] [PATCH v1] device_tree: load_device_tree():
 Allow NULL sizep
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
X-List-Received-Date: Fri, 22 Jun 2012 10:24:25 -0000

On Fri, Jun 22, 2012 at 7:15 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> On Thu, Jun 21, 2012 at 02:51:24PM +1000, Peter A. G. Crosthwaite wrote:
>> The sizep arg is populated with the size of the loaded device tree. Sinc=
e this
>> is one of those informational "please populate" type arguments it should=
 be
>> optional. Guarded writes to *sizep against NULL accordingly.
>>
>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
>> ---
>> =A0device_tree.c | =A0 =A08 ++++++--
>> =A01 files changed, 6 insertions(+), 2 deletions(-)
>
> Can someone who knows device trees review this?
>
> All current users need the size in order to copy the fdt into guest
> memory. =A0Why should the size argument be optional?
>

Hi Stefan,

Its required for an incomplete series i'm working on ATM. But it
should be optional just from a general coding practice because its an
informational "please populate on return argument". Forcing clients to
declare dummy variables to hold return values they dont want is just
bad programming practice. And assuming that clients are going to use
the function to blob in memory, therefore they need to know the size
in putting policy to an API that is more about mechanism. It would
also be more consistent with the rest of the qemu_devtree_foo
functions in that they all have length pointer functions (*len) that
are optional.

Regarding my large series, Im sending through general cleanup patches
like this as I go, rather than confusing my series with stuff like
this. The intention is to make life easier from a review point of view
as I don't wan't to be in that [PATCH v20 50/50] place.

Regards,
Peter

> Stefan

