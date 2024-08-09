Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scJi5-0005bc-UE
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 03:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scJi3-0005aG-1Z
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 03:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scJi1-00054w-9r
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 03:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723187202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWR5XSabljgIgY4FlRNT+4+pydzf/00CjDvJVldKvNA=;
 b=P4Bjql5Q4kc+57Dh4ZeHMJ8xZyfakSUWHLpyerUsrYUGIZgGOBvMDVG/LCnHUwRtPVxqDp
 BOwnM7UcxCHOmyy2hDDdnh068pmRWe6AXyYfPaV/vFLN+koN0XfhqaXLgBkp3inPV4as8k
 0xJKHguh1YG0IcYyFIQvRdI+cQoOj8g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-fE0FscP0O4WfHHJk82JVkw-1; Fri, 09 Aug 2024 03:06:41 -0400
X-MC-Unique: fE0FscP0O4WfHHJk82JVkw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a7d63fbf4afso195999566b.2
 for <qemu-trivial@nongnu.org>; Fri, 09 Aug 2024 00:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723187200; x=1723792000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWR5XSabljgIgY4FlRNT+4+pydzf/00CjDvJVldKvNA=;
 b=KDCT3nlml6u17Z9JfolAywANmFKzjzXmOL7SYiIfax+Qj9JE2l1Zj9brolln9iFwrI
 JjfAnd2bkJj+vS1lB/GCQ3xMYeFnfjQeZj5zAHerOBwn/BiyzeQ7PZzqZmiTTTqor4/f
 siJ7QdM2zB0nO2D10GRF8prhkFhpHneav5lEZ5+qjaRHYHbxbPkTH9Iqrz6SOvoshJ1K
 CoSaXjyRexAnPyPfPH/Y+T1YKzV93vXnmxVGDIGUc5Mpd4M8TCHT5mOBdeu/WnHFpS2x
 o90z6Tennu3cn9nVyMSxQxDStLiuwpwbx4aAwmskt1kJo+z1d9ap7+7iHiuR2CJ+JVSL
 rnWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0gg0do86usAWUwaa61m/nbGRDN+jfQRgttmz4RWFiO0E3lMmvSGTASevYPuC0Ax0chmw/t5lKXNHlxah+2DPr/vF086e29Q==
X-Gm-Message-State: AOJu0Yz0Uhb6y387Muhymu5VwhexQLhE4c5rbEqvZ+gDoYvT1TdyrDgQ
 BrbU6BTxBudZgdNr8kQDlDEWBaHzxz3F16mJWEuYdz1hsspGoEj3hT72E8l5i1yMoOnpOf9ANYd
 At0aOn99Y3QSHQPuz1j1oC/WcX8HWlXSQ97KenNCiNOu/2vKibr/ax9kxWL2Md9GktexrK0AcdO
 lZ/Hk6IgXvxWLF5pgJen+67OV7eSjz1A==
X-Received: by 2002:a17:907:e9f:b0:a77:eb34:3b53 with SMTP id
 a640c23a62f3a-a80aa54a106mr50346066b.8.1723187200223; 
 Fri, 09 Aug 2024 00:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvS5lezVzvNSN1dUYNrZE/sRuTw78FPTUh9oAbkAfwMkDzSes8eZqi0QGbhpzCPpOLyg+cJ5EkUUX+pPGxdv4=
X-Received: by 2002:a17:907:e9f:b0:a77:eb34:3b53 with SMTP id
 a640c23a62f3a-a80aa54a106mr50344866b.8.1723187199733; Fri, 09 Aug 2024
 00:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240809051054.1745641-1-anisinha@redhat.com>
 <20240809051054.1745641-2-anisinha@redhat.com>
 <ZrWziCQWgLogq+lV@intel.com>
In-Reply-To: <ZrWziCQWgLogq+lV@intel.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Fri, 9 Aug 2024 12:36:28 +0530
Message-ID: <CAK3XEhPioDt8HsaZXSChPZG=xR7ahjZJbp3COG0K+JhcTftPkg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kvm: replace fprintf with error_report() in
 kvm_init() for error conditions
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 kvm@vger.kernel.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Aug 2024 07:06:48 -0000

On Fri, Aug 9, 2024 at 11:27=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> On Fri, Aug 09, 2024 at 10:40:53AM +0530, Ani Sinha wrote:
> > Date: Fri,  9 Aug 2024 10:40:53 +0530
> > From: Ani Sinha <anisinha@redhat.com>
> > Subject: [PATCH v2 1/2] kvm: replace fprintf with error_report() in
> >  kvm_init() for error conditions
> > X-Mailer: git-send-email 2.45.2
> >
> > error_report() is more appropriate for error situations. Replace fprint=
f with
> > error_report. Cosmetic. No functional change.
> >
> > CC: qemu-trivial@nongnu.org
> > CC: zhao1.liu@intel.com
> > Signed-off-by: Ani Sinha <anisinha@redhat.com>
> > ---
> >  accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
> >  1 file changed, 18 insertions(+), 22 deletions(-)
> >
> > changelog:
> > v2: fix a bug.
>
> Generally good to me. Only some nits below, otherwise,
>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>
> >  #ifdef TARGET_S390X
> >          if (ret =3D=3D -EINVAL) {
> > -            fprintf(stderr,
> > -                    "Host kernel setup problem detected. Please verify=
:\n");
> > -            fprintf(stderr, "- for kernels supporting the switch_amode=
 or"
> > -                    " user_mode parameters, whether\n");
> > -            fprintf(stderr,
> > -                    "  user space is running in primary address space\=
n");
> > -            fprintf(stderr,
> > -                    "- for kernels supporting the vm.allocate_pgste sy=
sctl, "
> > -                    "whether it is enabled\n");
> > +            error_report("Host kernel setup problem detected. Please v=
erify:");
>
> The doc of error_report() said it doesn't want multiple sentences or trai=
ling
> punctuation:
>
> "The resulting message should be a single phrase, with no newline or trai=
ling
> punctuation."
>
> So I think these extra messages (with complex formatting & content) are
> better printed with error_printf() as I suggested in [1].
>
> [1]: https://lore.kernel.org/qemu-devel/ZrWP0fWPNzeAvjja@intel.com/T/#m95=
3afd879eb6279fcdf03cda594c43f1829bdffe
>
> > +            error_report("- for kernels supporting the switch_amode or=
"
> > +                        " user_mode parameters, whether");
> > +            error_report("  user space is running in primary address s=
pace");
> > +            error_report("- for kernels supporting the vm.allocate_pgs=
te "
> > +                        "sysctl, whether it is enabled");
> >          }
> >  #elif defined(TARGET_PPC)
> >          if (ret =3D=3D -EINVAL) {
> > -            fprintf(stderr,
> > -                    "PPC KVM module is not loaded. Try modprobe kvm_%s=
.\n",
> > -                    (type =3D=3D 2) ? "pr" : "hv");
> > +            error_report("PPC KVM module is not loaded. Try modprobe k=
vm_%s.",
> > +                        (type =3D=3D 2) ? "pr" : "hv");
>
> Same here. A trailing punctuation. If possible, feel free to refer to
> the comment in [1].

vreport() adds a training newline, so I think its ok to remove the
training newline and replace with error_report().

>
> >          }
> >  #endif
>
> [snip]
>
> > @@ -2542,8 +2538,8 @@ static int kvm_init(MachineState *ms)
> >      }
> >      if (missing_cap) {
> >          ret =3D -EINVAL;
> > -        fprintf(stderr, "kvm does not support %s\n%s",
> > -                missing_cap->name, upgrade_note);
> > +        error_report("kvm does not support %s", missing_cap->name);
> > +        error_report("%s", upgrade_note);
>
> "upgrade_note" string also has the trailing punctuation, and it's
> also better to use error_printf() to replace the 2nd error_report().

Yes this looks ugly and I will replace this one with error_printf()

>
> For this patch, error_report() is already a big step forward, so I think
> these few nits doesn't block this patch.

Thanks but I will send another version with your tag added.

>
> Thank you for your patience.
> Zhao
>


