Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2070CA0FED
	for <qemu-trivial@archiver.kernel.org>; Tue, 26 Aug 2025 21:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ur1DE-0003bo-LC; Tue, 26 Aug 2025 17:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ur1D6-0003XY-6h
 for qemu-trivial@nongnu.org; Tue, 26 Aug 2025 17:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ur1D3-0000EQ-K5
 for qemu-trivial@nongnu.org; Tue, 26 Aug 2025 17:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756243680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ky0SJpiPhbi6tJKr855XwA4Hgq9rsqFKwYVfBKO3Cw=;
 b=TYswtL7OaMfJHKgKd/zzXMb+eZqq1YCKyq1cp4a5pcLb0Z+1UxIAax2GNFIKu6Kb7iILED
 IhuNP+OG746zuATneO6WCCcw1rNyzsuBPFJSKAzhxwYY1D59VmJARfEggfY9tb2n3PpMu1
 Cw9mJLW8uSP/pkZHloqWI1kUv53cQaA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-vgvV8i47MTq2LyYZLIbAjw-1; Tue, 26 Aug 2025 17:27:59 -0400
X-MC-Unique: vgvV8i47MTq2LyYZLIbAjw-1
X-Mimecast-MFC-AGG-ID: vgvV8i47MTq2LyYZLIbAjw_1756243678
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-71fee811ed4so5715727b3.1
 for <qemu-trivial@nongnu.org>; Tue, 26 Aug 2025 14:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756243678; x=1756848478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ky0SJpiPhbi6tJKr855XwA4Hgq9rsqFKwYVfBKO3Cw=;
 b=N04eXYMENvDQlG0syC2HJ/Wtp3Kd4oJGxrYWdK5cAJnmbA+22FwtWj2+BAAK4HQYmS
 +ms0rQG+w5J6XZPJTzSGuegLV/PHJGQRQXXZ+t8Ih8u0LzRK/83KJjfaP/GLHEj9VYai
 tqDJ/TOwG9pX1IlCqfV5lTIWtKjF1sSXks8PZS/4b5GSnQXBL2AZAJF+MyNVdTETJkxB
 pKTi1vbF6ENERnSr+Wj+J23Wdkgcg37vw+A3SrpbSu2FdbQ2tor0z6w2GV60cYSk+fuO
 T6oE22vbp/g1cILmJFeIPvwIyQ2ABv+AwXGCwfZDzwoJNfWahFkLWuU6YMycTvmENxw6
 9KEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe9hQKgZSPnczaRSkdx2C7WRhnsBGxg3qr0W2h2ts9a/KRYVzBEdxB7VqDcdBZq2D56rrK+7ZnrTwfL3g=@nongnu.org
X-Gm-Message-State: AOJu0YwUr0TgdfPrxAcXoob2Vq/D9tQnUA/eecQiQXq+L3g+/F/a5dKT
 G2wUBO1ZlT9GCA/eptAuodka87lQLrSJW/8RGOD+JpPXAKo5PrW3AVDu76qfLCExhI5qz8K4YPI
 YnosbM76xqoWncBEBXHQH1ML0rqrQ5fT3pxqL12ZfU1rK37KUBCigqYxrzvY=
X-Gm-Gg: ASbGncsiq7Y0JGrOOhHA5vH4MIGOMjiW8Pv8vBPD635BGNTDV/ktZ1LbXXfjinBz1Q3
 3x3zQILxNDbmHG/3YtxFNZA7SljcSDRFoNqMYFHdbfbKBIzg6bU/P3WEA66vAHmd68c2PhMfdvc
 6g0HgDHFgMeoJVnFdZNPaDBSPRTjXfDlaT7tNe+sk9rZPpniWuHHhxq4aEuFKgLNXUcBueq7LB6
 gA4rLP4/GRbTKnQTPZcKVwPuVe0iUU6KTO9WKtZSLPzojHz4VOD6Nny6sdL44qcbQ662KjXQgnI
 t1+2yMdSPCyPllydaN0oMyohkk+6bW1X
X-Received: by 2002:a05:690c:64c2:b0:71f:9a36:d332 with SMTP id
 00721157ae682-72132cd7798mr33037167b3.27.1756243678496; 
 Tue, 26 Aug 2025 14:27:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH38QT9GrhuJKn+2Z/fzyJnt7wYtrhE1kDIfOcax70UAAJ8Yx5kG7DPSQZWCv6zlXXz+zuq0Q==
X-Received: by 2002:a05:690c:64c2:b0:71f:9a36:d332 with SMTP id
 00721157ae682-72132cd7798mr33036977b3.27.1756243677973; 
 Tue, 26 Aug 2025 14:27:57 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71ff18ea7a3sm26820817b3.69.2025.08.26.14.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 14:27:57 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:27:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: farosas@suse.de, Marco.Cavenati@eurecom.fr, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] migration: fix SEEK_CUR offset calculation in
 qio_channel_block_seek
Message-ID: <aK4m0MtycEi32--U@x1.local>
References: <871pudmlmj.fsf@suse.de>
 <dc23eaca-15f5-40be-89d0-2247cfe1f716@tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <dc23eaca-15f5-40be-89d0-2247cfe1f716@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o2sRMXtxUlUsfT_I3y3qk_r_f6MNlblvSS5_4xULmkU_1756243678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Aug 26, 2025 at 11:32:20PM +0300, Michael Tokarev wrote:
> Hi!
> 
> This is
> 
> commit c0b32426ce56182c1ce2a12904f3a702c2ecc460
> Author: Marco Cavenati <Marco.Cavenati@eurecom.fr>
> Date:   Wed Mar 26 17:22:30 2025 +0100
> 
>     migration: fix SEEK_CUR offset calculation in qio_channel_block_seek
> 
> which went to 10.0.0-rc2, and has been cherry-picked to
> 7.2 and 9.2 stable series.
> 
> Reportedly it breaks migration in 7.2.18 and up.  Which is
> kinda strange, as it shouldn't do any harm?
> 
> https://bugs.debian.org/1112044
> 
> any guess what's going on?

The only thing I can think of is, when it used to save to some file /
snapshot, then if the old image was stored with some wrong offsets (due to
wrong seek()s) then a new QEMU with correct offsets will instead read wrong
data even if they started to do the right things..

The reporter says:

        This occurs during live-migrating a guest onto a host with u15,
        migrating it back fixes the softlocks. A reset is required to fix
        it but is only required when the receiving host is on the latest
        version.

So it's a host-to-host live migration.  Is that using TCP as URI?  The
problem is I don't even think TCP layer should use io_seek at all.

qio_channel_io_seek() is only used in below (except VFIO when used with
multifd, that doesn't look like what the reporter was using..):

*** migration/file.c:
file_start_outgoing_migration[121] if (offset && qio_channel_io_seek(ioc, offset, SEEK_SET, errp) < 0) {
file_start_incoming_migration[190] qio_channel_io_seek(QIO_CHANNEL(fioc), offset, SEEK_SET, errp) < 0) {

*** migration/qemu-file.c:
qemu_set_offset[611]           ret = qio_channel_io_seek(f->ioc, off, whence, &err);
qemu_get_offset[624]           ret = qio_channel_io_seek(f->ioc, 0, SEEK_CUR, &err);

All these references are about file migrations, not generic live
migrations..

-- 
Peter Xu


