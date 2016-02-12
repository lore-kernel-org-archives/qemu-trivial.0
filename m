Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aUE7q-0007d0-EO
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2016 08:51:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1aUE7n-0007b5-Vn
	for qemu-trivial@nongnu.org; Fri, 12 Feb 2016 08:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1aUE7m-0006iK-Qd
	for qemu-trivial@nongnu.org; Fri, 12 Feb 2016 08:51:07 -0500
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231]:33837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1aUE7m-0006iF-F6; Fri, 12 Feb 2016 08:51:06 -0500
Received: by mail-ob0-x231.google.com with SMTP id wb13so122095654obb.1;
	Fri, 12 Feb 2016 05:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JF/17iWOyflaHS0d2FBDEZP5ENafVp9ttM5QyvzmYzE=;
	b=MDdfQG50eMTeU4ceISFVhDRFfvziSL3sdr7qL+3fA4pCcRT4HbyLzkOvKxLCVtjZyE
	sRfh+V6/RkSC4W2+4UASnzHnDuDU5diBiB6Slja5od93+Gvezvdz2/e/tQkzftSrtB8F
	b7fGXN1LwEAAUge3Vzxpdb8ch9p3NT+g7BiauJDvs8Cl4b5Z/2+pyRtPpywdYQLVNjfu
	78zAk2sBHEE5jQgfKAYjOQMimv51YwTm9VIo6NkzK/l/2ouAi+lcynvv1Qjrb+EhcC3g
	oxYFwZtKPUB+RAH9E5Blujb0P2r5Lia+8hpxnHXudLsA564w8D1rd/FXy2C7vtLMMwLU
	dfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JF/17iWOyflaHS0d2FBDEZP5ENafVp9ttM5QyvzmYzE=;
	b=hnAwDy1qHdoQSV7dQ4Xxk0sQqnzcUQTkpsnZbjdvkR4slODWyRB+6tQP5dOaLmjKcM
	hTlv6e8ClyoNlwh7GNvuDtnRB+iYuAciqtPgxLnzc+FAHQ22PZWqC7Rp45fzZE4Iiqhg
	II6+7iiX5W48AXfEoK5K4gZwdFdmwyNYC/BJDx8W7S+u9QqXYBFdohdawfUydj9bO40Z
	8ChoJMlYPS8WzRNv1wkHbqa4fEpTGQszw7E8lsPk67y3PCxeMO0LMaFh4FBCI2T9Ldoy
	wJ3uuuqEAdTnxo7CYilvh/X24ikh6Wk4McoZYADfGk75lmGd0UlCveVLu3cF+2RIG+a+
	9QEg==
X-Gm-Message-State: AG10YOQLsJp/xguubDEbk8QiVKCYHCmFQSmnEXxZJCf8V4YxcPvBPj0hSImm2tFoZTRW9foYCVXkAP/sdcx7Gw==
MIME-Version: 1.0
X-Received: by 10.202.212.20 with SMTP id l20mr1214270oig.58.1455285065906;
	Fri, 12 Feb 2016 05:51:05 -0800 (PST)
Received: by 10.76.79.73 with HTTP; Fri, 12 Feb 2016 05:51:05 -0800 (PST)
In-Reply-To: <CAJ+F1C+fOokKt-E7bbZ31NO8tCp5ky2JN==zPm1mEZTktuR9AA@mail.gmail.com>
References: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
	<569368F6.3050704@msgid.tls.msk.ru> <56937240.2080305@redhat.com>
	<CAJ+F1C+fOokKt-E7bbZ31NO8tCp5ky2JN==zPm1mEZTktuR9AA@mail.gmail.com>
Date: Fri, 12 Feb 2016 14:51:05 +0100
Message-ID: <CAJ+F1C+KWgXWPPKPS3M85RSj+UFg01YgsP5h3bLYCeYKQw_9mg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Ashley Jonathan <jonathan.ashley@altran.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Keep pty slave file
 descriptor open until the master is closed
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
X-List-Received-Date: Fri, 12 Feb 2016 13:51:09 -0000

Hi

On Fri, Feb 12, 2016 at 3:29 AM, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> Hi
>
> On Mon, Jan 11, 2016 at 10:13 AM, Paolo Bonzini <pbonzini@redhat.com> wro=
te:
>>
>>
>> On 11/01/2016 09:33, Michael Tokarev wrote:
>>> 11.12.2015 14:29, Ashley Jonathan wrote:
>>>> I have experienced a minor difficulty using QEMU with the "-serial pty=
" option:
>>>>
>>>> If a process opens the slave pts device, writes data to it, then immed=
iately closes it, the data doesn't reliably get delivered to the emulated s=
erial port. This seems to be because a read of the master pty device return=
s EIO on Linux if no process has the pts device open, even when data is wai=
ting "in the pipe".
>>>>
>>>> A fix seems to be for QEMU to keep the pts file descriptor open until =
the pty is closed, as per the below patch.
>>>
>>> The patch looks fine, so
>>>
>>> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
>>>
>>> but I'd love to have an ACK from the maintainer about this one,
>>> or for it to pick it up.
>>
>> Ok, I'll pick it up after I've read up a bit more on PTYs.
>
> That patch slows down qemu a lot when using -chardev
> pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0. I forgot a
> lot about how pty/pts work, and reading some man pages didn't help me
> much to understand the issue, I would suggest to revert it until a
> better solution is found.

It looks like if a the slave is opened, then Linux will buffer the
master writes, up to a few kb and then throttle, so it's not entirely
blocked but eventually the guest VM dies. However, not having any
slave open it will simply let the write go and discard the data. At
least, virt-install configures a pty for the serial but viewers like
virt-manager do not necessarily open it. And, if there are no viewers,
it will just hang. If qemu starts reading all the data from the slave,
I don't think interactions with other slaves will work. I don't see
much options but to close the slave, thus reverting this patch.

Regarding the original bug, I wonder if the slave writing process
couldn't simply fsync/fdatasync (I guess you tried that already)
Probably better to interact with the guest with something else than a
terminal though..


--=20
Marc-Andr=C3=A9 Lureau

