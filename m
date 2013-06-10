Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlyBk-0006Ao-KX
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 05:14:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UlyBg-0006Ad-H3
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 05:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UlyBa-0006OT-Tc
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 05:14:52 -0400
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229]:52527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UlyBa-0006No-N9
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 05:14:46 -0400
Received: by mail-bk0-f41.google.com with SMTP id jc3so3195654bkc.14
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 02:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=NnPaOtb399xATuRKM0WjgKxhFo/iAUhhWWMIo1SaoSQ=;
	b=fBZoWf/uV5WcNk6tXLWcw8jOo6IB+/Jn/ndp+ITsBRkBbWIh2btl2YhxB/rAF8Bo0D
	TPtAAKcyexBF79OKAe/XvMIcEA4sFmXSFj5v4dFG1dl1q01IO1dpFzvUkAmGWBlpPWTb
	vfJHktxQs5PugdisXVdTD9sGUZlYV7m0QYu5ZblKtHLdIDBUSiggd31xhiLIX9tpIu8S
	jX0jcW55tDHscHd51bbgEZ/9+GvkdeuH9IzxXuc7fOIf6HpqdGBi969MGNeKw6r+a9d4
	KTmD48M9Tt3hZpZGvkUDGVweMCksUn28vix2amzpvnegcRAlZtociDidfJ5n3l+JIfHa
	Q22g==
MIME-Version: 1.0
X-Received: by 10.204.191.132 with SMTP id dm4mr1368107bkb.66.1370855685129;
	Mon, 10 Jun 2013 02:14:45 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 10 Jun 2013 02:14:45 -0700 (PDT)
In-Reply-To: <51B563CC.5040907@redhat.com>
References: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
	<51B2E26F.8030106@msgid.tls.msk.ru> <51B563CC.5040907@redhat.com>
Date: Mon, 10 Jun 2013 19:14:45 +1000
X-Google-Sender-Auth: v2bSolFoJ5ASCq18ueIPLWAdeEc
Message-ID: <CAEgOgz6PmZ+gvhH9vVFiVqMvNXOBDn3Y+ny=tW+QHEu-eZ-LcQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQkOrEsEo4lbVef809NILn0AMYvESAa1GBZKOdQhAh5KfkTYhbgBUA4yN0HwoCND8XaGbOht
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::229
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org,
	=?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] ioport/memory: check that both .read and
 .write callbacks are defined
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
X-List-Received-Date: Mon, 10 Jun 2013 09:14:55 -0000

Hi,

On Mon, Jun 10, 2013 at 3:27 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>   Hi,
>
>> Maybe instead (or in addition to), we should provide a dummy
>> read or write functions -- instead of fixing each such occurence
>> to use its own dummy function
>
> Makes sense, especially for write where we can just ignore what the
> guest attempts to write.  Not sure we can have a generic handler for
> reads.  Maybe two, one which returns 0xff and one which returns 0x00.
>

FWIW, I have one in my tree that qemu_log(LOG_GUEST_ERROR's such
accesses that I use for unimplemented devices. It's worthwhile to trap
such accesses and speaking for the Xilinx LQSPI case, my preference is
for some form of failure rather than silent write-ignore. And can we
have an option where a invalid writes have consistent behavior with
unassigned accesses?

Regards,
Peter

> cheers,
>   Gerd
>
>

