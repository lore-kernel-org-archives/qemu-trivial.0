Received: from mailman by lists.gnu.org with archive (Exim 4.43)
	id 1Q8uEo-0000pB-3Z
	for mharc-qemu-trivial@gnu.org; Sun, 10 Apr 2011 08:59:34 -0400
Received: from [140.186.70.92] (port=45245 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.43) id 1Q8o3M-0004Ea-U5
	for qemu-trivial@nongnu.org; Sun, 10 Apr 2011 02:23:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Q8o3L-0000Tj-Ae
	for qemu-trivial@nongnu.org; Sun, 10 Apr 2011 02:23:20 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:36382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Q8o3L-0000Tf-7V
	for qemu-trivial@nongnu.org; Sun, 10 Apr 2011 02:23:19 -0400
Received: by yxk8 with SMTP id 8so2311372yxk.4
	for <qemu-trivial@nongnu.org>; Sat, 09 Apr 2011 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=+dbvF7l5UNi6B3NEq0+KrC7oBJG4BX2qwT1hE69vYiU=;
	b=DVTg4/gafR0WDwUTMfy7Ipg6tk16GfI8Roq9E7Qzc18A1FOiYkIgR9Gk28oMRy4/g8
	fL/1ZyOjHV2HjaphleE1EJcrGcI5mw6tldT0YPuNWrggnGRa5JGWYQGRpBio5jdIp581
	MIkMp6rFp80uFNf/TNjgjUoAaX5C7Y/a045kg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=xsEVfl/1edy4nnmqFct+bi9bxUYKt8T3OfbmxnSwNq2oc9EpChQsGSSa/u/Zj2W8TB
	u91LbBbn2RA4lUAdXuRIW/7b93zWY+UR9aMywCZzcRVCIdkwIB6+vjsMleAG5Vkt75JB
	ksu5IETH3FbaLF9ZeyuKZfff46PmFRvybpULw=
MIME-Version: 1.0
Received: by 10.146.216.22 with SMTP id o22mr3479486yag.25.1302416597584; Sat,
	09 Apr 2011 23:23:17 -0700 (PDT)
Received: by 10.147.38.1 with HTTP; Sat, 9 Apr 2011 23:23:17 -0700 (PDT)
In-Reply-To: <BANLkTimj0h5Xm9YrrEzkBdeVGf=cLQubzw@mail.gmail.com>
References: <BANLkTikZuagoaj7GBeJiEwJpHtdoNASCOw@mail.gmail.com>
	<BANLkTinfEm0aGPY05VvVUrs8+zfB+AGM9A@mail.gmail.com>
	<BANLkTimj0h5Xm9YrrEzkBdeVGf=cLQubzw@mail.gmail.com>
Date: Sun, 10 Apr 2011 07:23:17 +0100
Message-ID: <BANLkTinBgN1PNs3DxEXKz7E9=XWeo__FUQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jordan Justen <jljusten@gmail.com>
Cc: qemu-trivial@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
X-Mailman-Approved-At: Sun, 10 Apr 2011 08:59:32 -0400
Subject: [Qemu-trivial] Re: qemu trivial patch branches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: qemu-trivial.nongnu.org
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2011 06:23:21 -0000

On Sun, Apr 10, 2011 at 12:54 AM, Jordan Justen <jljusten@gmail.com> wrote:
> On Fri, Apr 8, 2011 at 01:41, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Thu, Apr 7, 2011 at 11:42 PM, Jordan Justen <jljusten@gmail.com> wrot=
e:
>>> On Wed, Apr 6, 2011 at 13:42, Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
>>>> Merged into my trivial-patches tree:
>>>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patc=
hes
>>>
>>> Maybe you could list the trivial patch branches on:
>>> http://wiki.qemu.org/Contribute/TrivialPatches
>>>
>>> ...so, trivial contributors (like myself :) can check to see if their
>>> trivial patches are making progress.
>>
>> Bien sur! =A0I've updated the page. =A0In the future please feel free to
>> update the wiki :).
>
> I changed the email address on that page to qemu-trivial@nongnu.org,
> as trivial-patches@qemu.org was not delivering for me.
>
> I also wanted to add:
> =A0- [http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-p=
atches
> browse]
> But, the re-captcha is not working, and the wiki requires it for
> adding urls. =A0Should I report this to the dev list?

Anthony Liguori <anthony@codemonkey.ws> maintains the qemu.org server.
 He may be able to help directly.  Captchas have always worked for me
so I'm not sure what the issue could be.

Stefan

