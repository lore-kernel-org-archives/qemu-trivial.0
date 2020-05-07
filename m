Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWnEf-0007Fh-H9
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2020 16:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jWnEc-0007DW-Fk
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 16:35:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42227
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jWnEa-0005bD-Ff
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 16:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588883703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAYXFNluzkqZAaoDrXjzfBjhIDXLC7BCe0VUcK7y9fk=;
 b=i2OiTzcwp4RgrJW1xTrwE8jOddmRnwEhvK9XQWdleTVLD6FGEAY8gsOmDBvb77I0e/EUIj
 oLIDJYLgJzBmy+LHEGPXaW0H5PuH/FL7MYMfu5IWaC3rxINxo3/1H75HMrMJroE7VVg9q1
 Kx/YijW/nw/iG7684Lz0GX+Yny1KeX0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-KuPuaV9sMr6JFCJzVFSqrw-1; Thu, 07 May 2020 16:35:02 -0400
X-MC-Unique: KuPuaV9sMr6JFCJzVFSqrw-1
Received: by mail-wr1-f72.google.com with SMTP id g10so4106162wrr.10
 for <qemu-trivial@nongnu.org>; Thu, 07 May 2020 13:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IZlgMjFm//amAEpDGqg31nfjDi38pg58wDcj7AnHmFI=;
 b=sfqmB1z/uJABDQ7jnmVcF4tqpKgoTjxLsGi0f6RrKJ34qIwnLoPMezEs8QKnXTP4KK
 FqmrEiEXOda2QyHGmNx66VzQKP+gViLFtPpeK0WnKYmWoB1RItHz2Y7RLg4vJp0ZGHlo
 750T1oFsGxa1FyoR3uT0CnbrT7WtYMfPpGeb/N8BoWeaTYe91JIf+nHEX2nRxxlxefvh
 sgh4VFh8E1o+of3yJIIBJxUIZGED62wDdbTeFWXSUaH67qTqq1llrJQeifvtAb3VPvMJ
 kF14MO8GA2PrrgoWMqCwaKYNiE3//tnM2ZFcWMC0cEvumW7uWwqB8ZovSKOUisD381ib
 NZfg==
X-Gm-Message-State: AGi0PuaX17CB+f51ea4VPRlYpf4gwf8Y6a9gPX4LnCbEF3semLJbhcoz
 9NO4Y5ViGw9VzLkrDlY5PCiLc/OUjv0HGX1ZrB6cjBTDj51hfqnF3EC6HfMUjwqMam/7e9WFF02
 q9VVIIZN4SDqF//dIKg==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr11621938wmc.136.1588883701439; 
 Thu, 07 May 2020 13:35:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypJuoKTJIECeCifsho4oEs+utMlWnW7kOK5hHxFqUEuROdjU/nIs/TZqArP5oQmbLclKU+zdfQ==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr11621930wmc.136.1588883701226; 
 Thu, 07 May 2020 13:35:01 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 h2sm10038598wmf.34.2020.05.07.13.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:35:00 -0700 (PDT)
Date: Thu, 7 May 2020 16:34:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, raphael.s.norwitz@gmail.com
Subject: Re: [PATCH] Fix erroneous double negation in conditional
Message-ID: <20200507163220-mutt-send-email-mst@kernel.org>
References: <1588046669-24706-1-git-send-email-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <1588046669-24706-1-git-send-email-raphael.norwitz@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 May 2020 20:35:10 -0000

On Tue, Apr 28, 2020 at 12:04:29AM -0400, Raphael Norwitz wrote:
> In vhost_migration_log() there is the following check:
>     if(!!enable =3D=3D dev->log_enabled) {
>         return 0;
>     }
>=20
> The double negative =E2=80=9C!!=E2=80=9D is unnecessary and bad coding st=
yle.

It converts the value to bool.

> This
> change removes it.
>=20
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  hw/virtio/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index aff98a0..83be0c8 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -814,7 +814,7 @@ static int vhost_migration_log(MemoryListener *listen=
er, int enable)
>      struct vhost_dev *dev =3D container_of(listener, struct vhost_dev,
>                                           memory_listener);
>      int r;
> -    if (!!enable =3D=3D dev->log_enabled) {
> +    if (enable =3D=3D dev->log_enabled) {
>          return 0;
>      }
>      if (!dev->started) {
> --=20
> 1.8.3.1


