Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLYAR-0000uG-RO
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:49:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XLXq7-0002XK-Jm
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XLXph-0002kB-7G
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:28:11 -0400
Received: from mail-wi0-f178.google.com ([209.85.212.178]:49300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XLXpg-0002jF-WC
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:27:45 -0400
Received: by mail-wi0-f178.google.com with SMTP id hi2so1433207wib.17
	for <qemu-trivial@nongnu.org>; Sun, 24 Aug 2014 06:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=+qAx/EhvkA8dpg6k09UvMmZi1Ymmtu8gWpMywrFOPqk=;
	b=Rk9+UpW6L2fuZ8bGYenrUFj7bq1juiFtVZRKobDrrOF3toxsXnLcAK0jSdNK979Tjb
	T+uIzC/WqJSrP7fJUEozdSp42QaiNWLAxoU1QrSVyhoO+WWpAy8pgcYPeowAWbk2Mahb
	yvUwBeSbILcp/l3VKiX9Qc7MiWRAde1hbiqKZMEMGtEi4rafWWbldTndh3oP2kZL8ED+
	XbmSYyIrctpITQIPQwavcjZASUALWLLii2WWjTrWbOgZ+GzA6VCepEGm4XfyYVNGr1ls
	IBBenAljnLF6xJKmlX1j6+vwBJcLkUNtTjD6xb+Y8z29Du4BgxD8iAGeeeDqjnKP4vEB
	/SHw==
X-Gm-Message-State: ALoCoQlKAU4IBvEoZaDfEC3sawrXGVwDPMtIjUMbfMqnX7WsHa8Ed6/x3qunzev83umT/+FishqL
X-Received: by 10.180.102.105 with SMTP id fn9mr8986441wib.27.1408886864196;
	Sun, 24 Aug 2014 06:27:44 -0700 (PDT)
Received: from [10.0.1.86] ([91.205.155.63])
	by mx.google.com with ESMTPSA id bk9sm20516977wib.7.2014.08.24.06.27.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 24 Aug 2014 06:27:43 -0700 (PDT)
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Dmitry Fleytman <dmitry@daynix.com>
In-Reply-To: <53F9E43D.2020103@msgid.tls.msk.ru>
Date: Sun, 24 Aug 2014 16:27:40 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C43C4CF-F85B-4A13-81BC-B848F6663EA8@daynix.com>
References: <1408537634-3812-1-git-send-email-ben@xrsa.net>
	<53F9D55D.6060804@msgid.tls.msk.ru>
	<A9C9B9DB-AEEE-4D79-A968-E0F34671C865@daynix.com>
	<53F9E43D.2020103@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-Mailer: Apple Mail (2.1878.6)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.178
X-Mailman-Approved-At: Sun, 24 Aug 2014 09:49:08 -0400
Cc: qemu-trivial@nongnu.org, Tamir Shomer <tamirs@daynix.com>,
	qemu-devel@nongnu.org, Ben Draper <ben@xrsa.net>,
	Stefan Hajnoczi <stefanha@redhat.com>, Yan Vugenfirer <yan@daynix.com>
Subject: Re: [Qemu-trivial] [PATCH] vmxnet3: Pad short frames to minimum
	size (60 bytes)
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
X-List-Received-Date: Sun, 24 Aug 2014 13:28:30 -0000


On Aug 24, 2014, at 16:10 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:

> 24.08.2014 16:28, Dmitry Fleytman wrote:
>=20
>> Hi Michael,
>>=20
>> I=92m the maintainer of vmxnet3/pvscsi devices in QEMU. Thanks for =
CC=92ing me.
>=20
> Maybe you can add yourself to MAINTAINERS file as well? :)

Yes, this should be done.
How we do this? Should I send a patch for MAINTAINETRS?


> I dunno if that's actually needed, but at least this should
> stop "strain" patches like this to be sent to -trivial alone... ;)
>=20
>> I think this patch is correct and needed.
>>=20
>> As we saw a few times already on different operating systems,
>> vmware drivers expect short packets to be padded as required
>> by corresponding RFC. Therefore this patch fixes a real bug.
>=20
> Okay, since there's no entry for vmxnet in MAINTAINERS, and with
> your blessing, and since this is a rather specific device which
> is not in common use, I'll apply it to -trivial, for now, unless
> you want to pick it up and send a pull request for it.


-trivial is good enough for this patch.

>=20
> Given your description, I think it should be Cc: qemu-stable@.
>=20
>> Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
>=20
> Thanks,
>=20
> /mjt


