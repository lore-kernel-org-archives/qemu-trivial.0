Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQU4-000320-1w
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:07:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQTx-0002uG-71
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQTw-0003Qj-B0
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:07:13 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:49822)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQTw-0003Q6-3G
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:07:12 -0400
Received: by mail-wr0-x22e.google.com with SMTP id u96so1281284wrb.6
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=b13WuC00167dGW1L0cbLJWZd2qX4e5008ZJETl3G4Qw=;
	b=QvBAok+DFI4zJ/30N6Kf4xsdkvD+9p1A6HCo6lB0hR40si1lxJSCbXHiefow1XtUiI
	hkMbVNaAQtkbegTrCxPSVc0dQ8vWfB5kscglbi2m3U897VAd/3BC77pEYcCn8OmoLQed
	IZHowXqRIeMeY6d/4TD2YyvWRHSQt0txEIsQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=b13WuC00167dGW1L0cbLJWZd2qX4e5008ZJETl3G4Qw=;
	b=RmGSNLX/XkBVUPsgtuP1CdPaDOT6qgfnC8v6Z7ECNUfbBFPCV2UbTwnZZr2Xn2BZ4m
	l8oUYPZh3EDm8Ap9XBot5w70Env+OzJ61aaomYdeLrSq0/mh8/qJBpKsEEjGHXeKO8Yn
	5dOEIn4zfPYu+074XG2rvbyVv6GqF+wRClmQje697CIddKk3sDnBXJEPOFhSyM+8/WLA
	c9m8N8hX0oh+Fh/e7FM+qhsUYCwPI5HKeZ376i2RNkegVmEFPCQ65DZqH1iAWWOm5Jfi
	O4OwKOdY+8/ZxrOS9MqNIEDxynz+4spBl8BltNXyx56s8446gt6aeEZQIJLsomUt1+pS
	n/bA==
X-Gm-Message-State: AHPjjUihl0sFupPumSVfUWf+J1RCmJDmP5NRHa0p6yRB25wQaUkwMfNu
	04rqmnO9cSKu7y8OfJeFLvqz+sBTa0LoVCFjemSZVQ==
X-Google-Smtp-Source: AOwi7QDd1Afazp72VB8VV1F37tmDolhI6sOiEgup5liKkBsSgr8tMAjszQeayyW6ciaNIIujwJwHp88GhHEbeee46wE=
X-Received: by 10.223.198.202 with SMTP id c10mr5171655wrh.230.1506096430996; 
	Fri, 22 Sep 2017 09:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:06:50 -0700 (PDT)
In-Reply-To: <20170922154014.29350-2-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:06:50 +0100
Message-ID: <CAFEAcA9L2LL-aKFVJGCwe3QJdGsftKBcVNXSYnEG7gFy22cfEQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Alexander Graf <agraf@suse.de>, Cornelia Huck <cohuck@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [PATCH 01/34] hw: use "qemu/osdep.h" as first
 #include in source files
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
X-List-Received-Date: Fri, 22 Sep 2017 16:07:18 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/acpi/ipmi-stub.c             | 1 +
>  hw/audio/fmopl.c                | 1 -
>  hw/cpu/core.c                   | 1 +
>  hw/ppc/spapr_cpu_core.c         | 1 +
>  hw/smbios/smbios_type_38-stub.c | 1 +
>  hw/vfio/ccw.c                   | 2 +-
>  hw/virtio/vhost-vsock.c         | 2 +-
>  7 files changed, 6 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

