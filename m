Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl4m2-00057b-9Q
	for mharc-qemu-trivial@gnu.org; Sat, 08 Apr 2023 05:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pl4m0-00057H-Lg
 for qemu-trivial@nongnu.org; Sat, 08 Apr 2023 05:22:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pl4ly-0004Ok-P3
 for qemu-trivial@nongnu.org; Sat, 08 Apr 2023 05:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680945733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGP0y+SaPekxP1kD3NlTbAXEbA3CZ4hH0/9Z5w5XwBo=;
 b=e4Tw1Vm7pMPgw8iNtsKELi59CRvHXWYHiu7mo0N8vN9Tw/HhGPol8gkSwmi6sotkbZbOEV
 5E7XKYbBgOp+HgO55WvxU58VR0H10Kqfa5y04Y+MgdlUlJn6oy8w0UU3WbKQf0VFGt0UE0
 cj0b3fviE08wrz+oZ0Khu1L12ydwh7U=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-dpbOw0oxNQSctCzaUU18eA-1; Sat, 08 Apr 2023 05:22:11 -0400
X-MC-Unique: dpbOw0oxNQSctCzaUU18eA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1842ea21762so492695fac.7
 for <qemu-trivial@nongnu.org>; Sat, 08 Apr 2023 02:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680945731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZGP0y+SaPekxP1kD3NlTbAXEbA3CZ4hH0/9Z5w5XwBo=;
 b=oYFLl4JAINaAKdEXj981lmJzgis3QU6xG4SW0iZm2No0ECNAe2GM0rDso1cTWKVKFH
 mjBQlochn9GG8MxP8LdTAXNYd93Zf8OItwZVMmSfZFLE1jO2hQQtbYqfHYqSUBez91iE
 Gj/LB39br9d1frDdLI5r79PenTZSv6DJ4ipyGmPZBE64iuWh7K1ixpsjcRHSEW1MPULX
 mRCyRprrDvDkweg0w1EfpdrnsYScO62FKimPO47FPzrwupcA32xoKQmsm7rUE266seLh
 Sz1x08tIoDMY53BVRi677X6zPzGquAN/AsF3PaQVZ+pApGjl9YmmDp8zeTH/rCN/sMhm
 5+Zg==
X-Gm-Message-State: AAQBX9fdZHkbewMHnl+NiDIwiLQySxXVmdKWcAQIsuVKXPz/ii9DiBfC
 9mMCCrOHH4g7swvIc3OBGcfyhmJfkqLkuZi91xanrSPTncd2uIuv5UIWjBK8uy/O+MxXyDJcM8K
 Vn2FGlkS2SrfX0i9bYQ1W6QguZ4yjMaRz4A==
X-Received: by 2002:a05:6870:971e:b0:184:2e38:c7af with SMTP id
 n30-20020a056870971e00b001842e38c7afmr439366oaq.3.1680945731056; 
 Sat, 08 Apr 2023 02:22:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZhcBD79FyMovWcOWkEuovzxMMlMqeQgkLsY/ohCbJFbNt2ielppqAiBwSrNCx+gqUfEMRku9nqutb/2N6ia1I=
X-Received: by 2002:a05:6870:971e:b0:184:2e38:c7af with SMTP id
 n30-20020a056870971e00b001842e38c7afmr439360oaq.3.1680945730719; Sat, 08 Apr
 2023 02:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230327173058.199027-1-casantos@redhat.com>
 <ZCHZjfytWZ6pPzpk@redhat.com>
In-Reply-To: <ZCHZjfytWZ6pPzpk@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Sat, 8 Apr 2023 06:21:59 -0300
Message-ID: <CAC1VKkOn-DowAnszwzV_aRgsNQUYTOSwHti1ADAm0oyr8VNSXQ@mail.gmail.com>
Subject: Re: [PATCH V2] tracing: install trace events file only if necessary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 09:22:16 -0000

On Mon, Mar 27, 2023 at 2:59=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Mon, Mar 27, 2023 at 02:30:58PM -0300, casantos@redhat.com wrote:
> > From: Carlos Santos <casantos@redhat.com>
> >
> > It is not useful when configuring with --enable-trace-backends=3Dnop.
> >
> > Signed-off-by: Carlos Santos <casantos@redhat.com>
> > ---
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

I updated the patch to fix the array comparison and add a missing comma.

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


