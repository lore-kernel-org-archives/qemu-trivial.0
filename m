Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60BCCA9ED0
	for <qemu-trivial@archiver.kernel.org>; Mon, 12 Oct 2026 19:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xGM79-0004X8-Tt; Mon, 12 Oct 2026 15:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xGM75-0004Wa-Kx
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2026 15:55:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xGM73-0006UY-AV
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2026 15:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791834905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLJeDYUYjeX9xlerYn4DvwzSnpNc7rU+oKijboDlKzk=;
 b=gAqtJhlLosTfQzYqgOLBD82jnVd2VDSuSdZfoIioWnzL21WyUETPVsxTmh3hrKP5NJg+mU
 AqrohM1EcVE92cE9VY3dR5ccib0HOskYJ/gep8kn62KlTEi7rl9WgsY9JKGuqRi1wUSbee
 azkHT2Y/s9PcftT7Y7CTa22GY+OBiwE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-WSYwBd0uPfqwNE1uP3YJnQ-1; Mon, 12 Oct 2026 19:55:04 +0000
X-MC-Unique: WSYwBd0uPfqwNE1uP3YJnQ-1
X-Mimecast-MFC-AGG-ID: WSYwBd0uPfqwNE1uP3YJnQ_1791834903
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3ab7f1efe5dso4720076a91.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2026 12:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791834903; x=1792439703;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qLJeDYUYjeX9xlerYn4DvwzSnpNc7rU+oKijboDlKzk=;
 b=qlSzFrzv6BeKHF+j6rW3XFhal1OFoMV+khd2GDc7B0ZELmPPw/CEZzZfH8jgMCokAX
 KtiP/SsDWupvAWlyvEXSY1NQ/CipTtm18Bae7qPJa0devm9c/oCMibBmtDwPUmAz4S5j
 Umi5iWbEIwPtHdWZ2r09Oy6sFEw9e8+RRkr8RZxEmvEMYLP4P6lIODRxwV1l+uzokJ3c
 d8vksgmT3qEXXVlMLtso3kHDBtlaz/bkusMuDtvRlArOadnOKIGWtHnb6Yz52ke5i17w
 HPKbXXfw9Sh3VQRcXeMh+Me+oHg+OVwXaatQJ840LoBBqwMjk6r+v3lI3ojMSW2F4lVi
 a4sw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIiYzhhk3fQl+atXHBeiRRoMs7FsTetHYJjTuej2llTpEArWh1LOBcGnCyfrNysM3yyxjWa/X/kKBlZWY=@nongnu.org
X-Gm-Message-State: AFq9FYJvQ2CoFwjd7C1a8mXobsMxLasa8H5B1k0c3T4wV20YM1cEeL27
 nAWXlrPy2awIHJJSinynoiykKkS2Ou8xFMLFns2L9MdL/MihAfnde9hutFixBmqSqI4O/eY51QV
 MbeoqVeqFf1rfYwM54aK2Nf+5qXRJQOtkxh/uPvc1X5F2vMtO1Y6Kv9ub4Eq/LXvO4l4y7oUg4+
 QYbAOXFEAUQOqrMkxbiHLK7NEj86vZFClCaw==
X-Gm-Gg: AYBFou1uU6WwdIiDe+Dd4GUvV6mrlEBXgFOqsnEnYJIKhbyOAC/3KyjW5404pRc2Jtv
 CT2SyBER5wRKo0xEs+6pUcLyVeop8dR2/+m5bSbKg+d5kmzjvZlC0m3tZoz6nGqqEoGuoyz9a8R
 oOBGK5wWBIxAWnXo26Nf5McVcDbQ59Em6Di7O490hDOemTiV2SmNT18unQufs/9iG7pCyXkcFqN
 +0l1pUzKbWTdgZHK++Q8IKdhRL1ypqlIYSegy/z0CnOiqYbiMSmPau+N0Y0BlHAn/8MD3RMgXIG
 SQ==
X-Received: by 2002:a17:90a:d007:b0:3ac:3588:b548 with SMTP id
 98e67ed59e1d1-3ac3588b5edmr833171a91.13.1791834903222; 
 Mon, 12 Oct 2026 12:55:03 -0700 (PDT)
X-Received: by 2002:a17:90a:d007:b0:3ac:3588:b548 with SMTP id
 98e67ed59e1d1-3ac3588b5edmr833147a91.13.1791834902756; Mon, 12 Oct 2026
 12:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-use-qemu-dup-v1-1-03d94852a6c8@gmail.com>
In-Reply-To: <20261012-use-qemu-dup-v1-1-03d94852a6c8@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 12 Oct 2026 23:54:47 +0400
X-Gm-Features: AclHuK8l3L3goL5VpSPfzJvVuCXKjQCpqYY89uQAfl95EL5a-ZsDVBXW6lFf6Lc
Message-ID: <CAMxuvazc5iHk=GDysFHVFN0xtf-g75AobhoKdPXaR6_Qz=dDNg@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL] treewide: use qemu_dup() instead of dup()
To: Filip Hejsek <filip.hejsek@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TNQLBdtOA3fXeq9O3gu7cskOFfD5HdYuYolnUn6c4O0_1791834903
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi

On Mon, Oct 12, 2026 at 11:44=E2=80=AFPM Filip Hejsek <filip.hejsek@gmail.c=
om> wrote:
>
> Make the use of qemu_dup() more consistent and eliminate the possibility
> of accidentally creating non-cloexec fds.
>

Not so trivial, in my humble opinion, as there might have been some
reason it was avoided.

> Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>
> ---
>  hw/virtio/virtio.c | 2 +-
>  io/channel-file.c  | 2 +-
>  system/vl.c        | 9 +--------
>  ui/dmabuf.c        | 2 +-
>  4 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index c9f9e5b511..70779fbd56 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3204,7 +3204,7 @@ VirtioSharedMemoryMapping *virtio_shared_memory_map=
ping_new(uint8_t shmid,
>          return NULL;
>      }
>
> -    fd =3D dup(fd);
> +    fd =3D qemu_dup(fd);
>      if (fd < 0) {
>          error_report("Failed to duplicate fd: %s", strerror(errno));
>          return NULL;
> diff --git a/io/channel-file.c b/io/channel-file.c
> index 5cef75a67c..3f707e80c9 100644
> --- a/io/channel-file.c
> +++ b/io/channel-file.c
> @@ -48,7 +48,7 @@ qio_channel_file_new_fd(int fd)
>  QIOChannelFile *
>  qio_channel_file_new_dupfd(int fd, Error **errp)
>  {
> -    int newfd =3D dup(fd);
> +    int newfd =3D qemu_dup(fd);
>
>      if (newfd < 0) {
>          error_setg_errno(errp, errno, "Could not dup FD %d", fd);
> diff --git a/system/vl.c b/system/vl.c
> index 468a9fc247..9381e3d7f7 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -614,14 +614,7 @@ static int parse_add_fd(void *opaque, QemuOpts *opts=
, Error **errp)
>          return -1;
>      }
>
> -#ifdef F_DUPFD_CLOEXEC
> -    dupfd =3D fcntl(fd, F_DUPFD_CLOEXEC, 0);
> -#else
> -    dupfd =3D dup(fd);
> -    if (dupfd !=3D -1) {
> -        qemu_set_cloexec(dupfd);
> -    }
> -#endif
> +    dupfd =3D qemu_dup(fd);
>      if (dupfd =3D=3D -1) {
>          error_setg_errno(errp, errno, "error duplicating fd");
>          return -1;
> diff --git a/ui/dmabuf.c b/ui/dmabuf.c
> index 497f82cc61..6d5dffdf84 100644
> --- a/ui/dmabuf.c
> +++ b/ui/dmabuf.c
> @@ -95,7 +95,7 @@ void qemu_dmabuf_dup_fds(QemuDmaBuf *dmabuf, int *fds, =
int nfds)
>      assert(nfds >=3D dmabuf->num_planes);
>
>      for (i =3D 0; i < dmabuf->num_planes; i++) {
> -        fds[i] =3D dmabuf->fd[i] >=3D 0 ? dup(dmabuf->fd[i]) : -1;
> +        fds[i] =3D dmabuf->fd[i] >=3D 0 ? qemu_dup(dmabuf->fd[i]) : -1;
>      }
>  }
>

After review I think these changes are valid. These changes shouldn't
impact the exec() code paths in qemu.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> base-commit: 615ece3c406b262996e569f29ea6eed0d81c4d8d
> change-id: 20261012-use-qemu-dup-38628dbac3ee
>
> Best regards,
> --
> Filip Hejsek <filip.hejsek@gmail.com>
>


