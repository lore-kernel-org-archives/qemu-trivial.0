Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQsC-0007T8-6A
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:32:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQs9-0007Pr-OE
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:32:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQs9-0006fD-06
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:32:13 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:51830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQs8-0006eR-Qa
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:32:12 -0400
Received: by mail-wr0-x22d.google.com with SMTP id z39so1333168wrb.8
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1uecBQIRsPIk8FJReJ/TQZd0Z9mQDDfzVX3oX4iXxu4=;
	b=WKVPAgUn70Go/b/i7GEUukgsVr5AhhtYq8USjb7j8xL0q6wgIW04dO4dDyZBVlwV35
	Ao1CfC9fhzbNWLyTK40GXHraw+7s2+t9rU088cphRJY0PsbC/xLsTQMNbTDh7vvYzraw
	fZ8G9DaX2RypTTVDbpIeCBfhLoASwVBe6x1pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1uecBQIRsPIk8FJReJ/TQZd0Z9mQDDfzVX3oX4iXxu4=;
	b=uDK1nkb7pYQ/a3tOooAFOsHQU2BHo8WJJ+Lu/sGPhLJ4EqMMFUlDq5b2+RLEnt1SIp
	L+DVmKavT3165y3ObxmE4Eqa1p7QPIkjw1Dd1+0MfrBhmIoRJtIiewoFN53ziVxTXevH
	GBW0y21iTNTuO1GTCoxzR+1d267PW78y9Zq2YJ/xgqUyg6KzJKfh9+v4R4W1qov0ILme
	yoxEKyLfLYkE1M2WnA0ewsePWRFbO3TydrqFz0lXEAbODv7pi4J9yh1CCt8QLkOjC6HD
	TbKEIuqG2RKx5JWF3zqOiUNAisSnw3U1Lx5eZ0R+wAK/Ka9Y8ulX8r9syIhUJo4TUNt8
	i2UQ==
X-Gm-Message-State: AHPjjUjqquYY73EOPS9pij9Kzn5wRjmzBWEA9lrDqSBMnbKCfx9o7dn8
	IKoHCJPYkKdxzKNghvMeeadD/TkJJQ4i50w4CyBnNA==
X-Google-Smtp-Source: AOwi7QAQnOfzhrW1VIE8hnNZqCD1xVtuLbF9DU0YgM6IU440Z4J9n6kViAeTluNHNiK9ugSrJzmKCxdtcoteEsK1LCE=
X-Received: by 10.223.142.82 with SMTP id n76mr5865379wrb.272.1506097931719;
	Fri, 22 Sep 2017 09:32:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:31:51 -0700 (PDT)
In-Reply-To: <20170922154014.29350-5-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:31:51 +0100
Message-ID: <CAFEAcA8CmqHX6t_my8CDvw+32rPMuhFNPZYfBo9sdgb2ebLzSw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, 
	Ben Warren <ben@skyportsystems.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [PATCH 04/34] misc: remove headers implicitly
 included
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 16:32:14 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

