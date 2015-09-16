Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zc8mF-0002C4-3G
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 05:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1Zc8mC-00029k-PI
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 05:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1Zc8mB-0004oy-Uw
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 05:13:16 -0400
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:33474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1Zc8m9-0004oJ-T4; Wed, 16 Sep 2015 05:13:14 -0400
Received: by oixx17 with SMTP id x17so117976571oix.0;
	Wed, 16 Sep 2015 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=E1Z9UFZS9poq8DNAKOtejYESNYV6epIp1Om/EvAWtFk=;
	b=Gg84OksdkwqZ26bxEfA6gwbegLNrd7KAv/eTxmUN3FvDZpUiN9xQR2MzaV9Zfhge48
	oePyQnZMembSIxpnDe6MA1+tmWlkUO2pfZhgPJ+JVt0xNPmwywkN2rYJQOrTJHSSeTBO
	EEzT0OpbX3PYFtTw+ZkIlituvsPI8dRM7A+mBDXdDPn7IeAPW/zJ7oR3fSsmJkqkl/nP
	kucxbd27Xr7exvWdycjqfmwXwCWKOnI2fB0sVtynxPlPJcMw7klZPGgn+KP2B8iq49OL
	P1Nc8Bi3Mwi8YTm9w98h2XvNaaa/q+h514rX52ahuXqbcPuoFDT+YL+0at/RLePl7bk3
	KMhA==
MIME-Version: 1.0
X-Received: by 10.182.128.226 with SMTP id nr2mr23599488obb.69.1442394792922; 
	Wed, 16 Sep 2015 02:13:12 -0700 (PDT)
Received: by 10.76.180.9 with HTTP; Wed, 16 Sep 2015 02:13:12 -0700 (PDT)
In-Reply-To: <55F281CA.4030902@msgid.tls.msk.ru>
References: <1441744192-6110-1-git-send-email-marcandre.lureau@redhat.com>
	<55F281CA.4030902@msgid.tls.msk.ru>
Date: Wed, 16 Sep 2015 11:13:12 +0200
Message-ID: <CAJ+F1CLnxyXhaN1U0nvvu0WCur5fUf4owKeQGyymy4X+zN0xpg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::231
Cc: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] specs/vhost-user.txt: fix
	name of messages
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
X-List-Received-Date: Wed, 16 Sep 2015 09:13:17 -0000

Hi

On Fri, Sep 11, 2015 at 9:24 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> The patch doesn't apply to qemu master as vhost-user.txt does not
> have VHOST_GET_PROTOCOL_FEATURES in here.  What treee you're basing
> your patch on?

It is after your pending protocol feature patches.

> Besides, this is quite confusing.  Both VHOST_USER_GET_FEATURES and
> VHOST_GET_FEATURES #defines exists and used, which one is which?

I don't know what you mean, VHOST_USER_GET_FEATURES maps to
VHOST_GET_FEATURES. But the protocol should use only VHOST_USER*
constants.

I'll resend this patch later


--=20
Marc-Andr=C3=A9 Lureau

