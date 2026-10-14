Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D658FC3DA7A
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Oct 2026 19:40:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xH4pD-0005Mk-Ep; Wed, 14 Oct 2026 15:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1xH4p9-0005LW-Kh
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2026 15:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1xH4p7-0001CZ-Cl
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2026 15:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792006774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwkiY6WMEbShWO1TnK4W8ILc2Jk/Cj0j9CNwlzGBgfI=;
 b=W924iCf7mX9u99a4nIxH0M4wN98ZQCsZLmHV9we/5ZLRCMFaGLg1w8lMHnvMelvPmugp5Y
 UsIk90GdU6mLs1Mdm6LH9skt5VqGG6XkY1j5dohxzG6IvLAdZDbQZrdiecsYxi/R3qJg2M
 puwmrFX/PE0LXX0zBpA+ISVovoMb3yo=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-Bp4VEKezOQimPU1WCbQjdQ-1; Wed, 14 Oct 2026 19:39:33 +0000
X-MC-Unique: Bp4VEKezOQimPU1WCbQjdQ-1
X-Mimecast-MFC-AGG-ID: Bp4VEKezOQimPU1WCbQjdQ_1792006773
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-676956fd276so995627d50.1
 for <qemu-trivial@nongnu.org>; Wed, 14 Oct 2026 12:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792006773; x=1792611573;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cwkiY6WMEbShWO1TnK4W8ILc2Jk/Cj0j9CNwlzGBgfI=;
 b=uOHDJ0TOng66XhOfMWHnAwUNy0+Bs9HECjeyVdGBgCgANZGynEEyV+TE9ocMtTW2ZW
 X4PbwfHeok+MsEiJu87Qq7vCzdx8aKEh8fHOMzhU5pDFfL2QktWzbxdcGbDOy+sgaVzR
 C0Q3bMsmF1EZGZhNgYqXRbFj/TfUuGm1r96NUozGNFE4DpNqtzsOmPj7YjCqKN2YHuZa
 g+o8locDqwYX5Ao5Efb2OQgAGfNOFXUARUCgJ7JbPKUsZIyhFtwDWPDaKLfNSF/FWbM1
 8aLGKkituxzD9+mEc1ap0TkCjFtrfYbvA2f3KwY79O0lYmyhKzarUmgII4q+pFegyEgF
 VW8A==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5yxlMIww9oSYw/iHis3+R8FK8CVHSgwPvRsT1riGHMN+CkLDmdOvC7P3aQf105/qgA3uAXTpxr0nrBM8=@nongnu.org
X-Gm-Message-State: AFq9FYJQsE6laFxW/dD0+JCkNjcxR+7sR7ycG1wmKqIdI7n2MwjVr/hK
 gYVRKec9JQUn3vqin/haL0hranDIUUT7nF3jX5vKQERB+utcb07f8FQpMq+njBhRfPFImA3pzUa
 pJzj7luhbaLcJhnMcBWTHLZpz/r21FsRT0oejSS84jR6tFqhmS3pVn8XupqJdtrugDsNPOIiDOt
 Si81tklN1oip+9RHV0gA8sEKvUBvWmuj2/oQ==
X-Gm-Gg: AYBFou214UMNn7WsT5pRJz1DP+mrg3N0elLsIceShOnL4rDyk1OH/rj612B+S1evcXq
 rU9/fNqBn1e8RmftvDTeiDE093BHsZH5tQunkucRawUt1dAgHnR4qqH7t+xXmj7cMeJsXjCMEpX
 ylgiJhrA1k4t/zfLIyCEssPcmxhgrORXcxJAb7odko673Igybgo9W1zb2F22++xZE+RYZmDZkJ7
 stwxpQT5XjxeEu3
X-Received: by 2002:a05:690e:169c:b0:66f:c1be:a662 with SMTP id
 956f58d0204a3-67936306108mr8273275d50.84.1792006772782; 
 Wed, 14 Oct 2026 12:39:32 -0700 (PDT)
X-Received: by 2002:a05:690e:169c:b0:66f:c1be:a662 with SMTP id
 956f58d0204a3-67936306108mr8273265d50.84.1792006772019; Wed, 14 Oct 2026
 12:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-typos-in-docs-v1-1-75f2e1cd888e@gmail.com>
In-Reply-To: <20261012-typos-in-docs-v1-1-75f2e1cd888e@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 14 Oct 2026 15:39:20 -0400
X-Gm-Features: AclHuK_gCY0P5ZIgvhVwAWfrkzLxLRMQ2TAFRnFsArcYb3yx-12wgsFXjMHYE3A
Message-ID: <CAFn=p-bG9u1YJTQ7whAC0NohZXv=7Rx+gQwV-qWOz44VkrTZGA@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL] docs: fix a few typos
To: Filip Hejsek <filip.hejsek@gmail.com>
Cc: qemu-devel@nongnu.org, Luc Michel <luc@lmichel.fr>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jason Wang <jasowangio@gmail.com>, Yuri Benditovich <ybendito@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Gautam Menghani <gautam@linux.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nqidgTQE7RiX_5E8fQxMtqzZdKuUrB35Rc3jWcrsR3c_1792006773
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Oct 12, 2026 at 12:34=E2=80=AFPM Filip Hejsek <filip.hejsek@gmail.c=
om> wrote:
>
> Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>

LGTM

Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!

> ---
>  docs/devel/clocks.rst                 | 2 +-
>  docs/devel/control-flow-integrity.rst | 2 +-
>  docs/devel/docs.rst                   | 2 +-
>  docs/devel/ebpf_rss.rst               | 2 +-
>  docs/devel/multi-process.rst          | 6 +++---
>  docs/devel/submitting-a-patch.rst     | 2 +-
>  docs/interop/vfio-user.rst            | 2 +-
>  docs/specs/ppc-spapr-hcalls.rst       | 2 +-
>  docs/specs/ppc-spapr-xive.rst         | 2 +-
>  docs/system/security.rst              | 2 +-
>  docs/user/main.rst                    | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 16de32147b..997b09c6a4 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -280,7 +280,7 @@ so you can use this to model clock controller devices=
 which
>  have guest-programmable frequency multipliers or dividers.
>
>  Similarly to ``clock_set()``, ``clock_set_mul_div()`` returns ``true`` i=
f
> -the clock state was modified; that is, if the multiplier or the diviser
> +the clock state was modified; that is, if the multiplier or the divisor
>  or both were changed by the call.
>
>  Note that ``clock_set_mul_div()`` does not automatically call
> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-f=
low-integrity.rst
> index 3d5702fa4c..466888bdf1 100644
> --- a/docs/devel/control-flow-integrity.rst
> +++ b/docs/devel/control-flow-integrity.rst
> @@ -39,7 +39,7 @@ are planning to also enable fuzzing, then Clang 11+ is =
needed (more on this
>  later).
>
>  Given the use of LTO, a version of AR that supports LLVM IR is required.
> -The easies way of doing this is by selecting the AR provided by LLVM::
> +The easiest way of doing this is by selecting the AR provided by LLVM::
>
>   AR=3Dllvm-ar-9 CC=3Dclang-9 CXX=3Dclang++-9 /path/to/configure --enable=
-cfi
>
> diff --git a/docs/devel/docs.rst b/docs/devel/docs.rst
> index a7768b5311..7fe7e44429 100644
> --- a/docs/devel/docs.rst
> +++ b/docs/devel/docs.rst
> @@ -5,7 +5,7 @@ QEMU Documentation
>
>  QEMU's documentation is written in reStructuredText format and
>  built using the Sphinx documentation generator. We generate both
> -the HTML manual and the manpages from the some documentation sources.
> +the HTML manual and the manpages from the same documentation sources.
>
>  hxtool and .hx files
>  --------------------
> diff --git a/docs/devel/ebpf_rss.rst b/docs/devel/ebpf_rss.rst
> index ed5d33767b..85ef547623 100644
> --- a/docs/devel/ebpf_rss.rst
> +++ b/docs/devel/ebpf_rss.rst
> @@ -31,7 +31,7 @@ Not for all packets, the hash can/should be calculated.
>
>  Note: currently, eBPF RSS does not support hash reporting.
>
> -eBPF RSS turned on by different combinations of vhost-net, vitrio-net an=
d tap configurations:
> +eBPF RSS turned on by different combinations of vhost-net, virtio-net an=
d tap configurations:
>
>  - eBPF is used:
>
> diff --git a/docs/devel/multi-process.rst b/docs/devel/multi-process.rst
> index 4ef539c0b0..cafe2aaba7 100644
> --- a/docs/devel/multi-process.rst
> +++ b/docs/devel/multi-process.rst
> @@ -158,7 +158,7 @@ IOMMUs introduce another level of complexity, since t=
he address given to
>  the guest virtio device to DMA to or from is not a guest physical
>  address. This case is handled by having vhost code within QEMU register
>  as a listener for IOMMU mapping changes. The vhost application maintains
> -a cache of IOMMMU translations: sending translation requests back to
> +a cache of IOMMU translations: sending translation requests back to
>  QEMU on cache misses, and in turn receiving flush requests from QEMU
>  when mappings are purged.
>
> @@ -573,7 +573,7 @@ live migration
>  When a remote process receives a live migration indication from QEMU, it
>  will set up a channel using the received file descriptor with
>  ``qio_channel_socket_new_fd()``. This channel will be used to create a
> -*QEMUfile* that can be passed to ``qemu_save_device_state()`` to send
> +*QEMUFile* that can be passed to ``qemu_save_device_state()`` to send
>  the process's device state back to QEMU. This method will be reversed on
>  restore - the channel will be passed to ``qemu_loadvm_state()`` to
>  restore the device state.
> @@ -853,7 +853,7 @@ intx irq descriptor
>
>  The irq descriptors are created by the proxy object
>  ``using event_notifier_init()`` to create the irq and re-sampling
> -*eventds*, and ``kvm_vm_ioctl(KVM_IRQFD)`` to bind them to an interrupt.
> +*eventfds*, and ``kvm_vm_ioctl(KVM_IRQFD)`` to bind them to an interrupt=
.
>  The interrupt route can be found with
>  ``pci_device_route_intx_to_irq()``.
>
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-=
patch.rst
> index 5ccd09a397..cd08881dfb 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -241,7 +241,7 @@ Use B4
>  ~~~~~~
>
>  The `b4`_ tool, used for Linux kernel development, can also be used for =
QEMU
> -development. It is packaged in most distros and PyPi. The QEMU source tr=
ee
> +development. It is packaged in most distros and PyPI. The QEMU source tr=
ee
>  includes a ``b4`` project configuration file at the root: ``.b4-config``=
.
>
>  Example workflow to prepare a patch series:
> diff --git a/docs/interop/vfio-user.rst b/docs/interop/vfio-user.rst
> index 1c92f442d2..3428241dae 100644
> --- a/docs/interop/vfio-user.rst
> +++ b/docs/interop/vfio-user.rst
> @@ -1505,7 +1505,7 @@ Neither the request or reply have a payload.
>  --------------------------------
>
>  This message can be used to coalesce multiple device write operations
> -into a single messgage.  It is only used as an optimization when the
> +into a single message.  It is only used as an optimization when the
>  outgoing message queue is relatively full.
>
>  Request
> diff --git a/docs/specs/ppc-spapr-hcalls.rst b/docs/specs/ppc-spapr-hcall=
s.rst
> index 6cdcef2026..550026ea55 100644
> --- a/docs/specs/ppc-spapr-hcalls.rst
> +++ b/docs/specs/ppc-spapr-hcalls.rst
> @@ -20,7 +20,7 @@ to an implementation specific range in PAPR.
>  ``H_RTAS (0xf000)``
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -RTAS stands for Run-Time Abstraction Sercies and is a set of runtime ser=
vices
> +RTAS stands for Run-Time Abstraction Services and is a set of runtime se=
rvices
>  generally provided by the firmware inside the guest to the operating sys=
tem. It
>  predates the existence of hypervisors (it was originally an extension to=
 Open
>  Firmware) and is still used by PAPR and LoPAR to provide various service=
s that
> diff --git a/docs/specs/ppc-spapr-xive.rst b/docs/specs/ppc-spapr-xive.rs=
t
> index f47f739e01..8b83942a29 100644
> --- a/docs/specs/ppc-spapr-xive.rst
> +++ b/docs/specs/ppc-spapr-xive.rst
> @@ -171,7 +171,7 @@ native exploitation mode* is selected should contain:
>  - ``reg``
>
>    contains the base address and size of the thread interrupt
> -  managnement areas (TIMA), for the User level and for the Guest OS
> +  management areas (TIMA), for the User level and for the Guest OS
>    level. Only the Guest OS level is taken into account today.
>
>  - ``ibm,xive-eq-sizes``
> diff --git a/docs/system/security.rst b/docs/system/security.rst
> index 75e39caede..1bd8423866 100644
> --- a/docs/system/security.rst
> +++ b/docs/system/security.rst
> @@ -107,7 +107,7 @@ an issue as a normal bug.
>    possibility of large memory peaks and apply countermeasures to
>    provide continuity of host operations. It is typical for the Linux
>    OOM killer to reap the process triggering host memory overcommit
> -  in the case of exccessive usage, offering a degree of protection.
> +  in the case of excessive usage, offering a degree of protection.
>    As such, bugs which can lead to excessive/unbounded memory allocations
>    will usually not be classified as security flaws, but should be
>    fixed as hardening bugs.
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index a8ddf91424..aef33bfd9a 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -23,7 +23,7 @@ System call translation
>  System calls are the principle interface between user-space and the
>  kernel. Generally the same system calls exist on all versions of the
>  kernel so QEMU includes a generic system call translator. The
> -translator takes care of adjusting endianess, 32/64 bit parameter size
> +translator takes care of adjusting endianness, 32/64 bit parameter size
>  and then calling the equivalent host system call.
>
>  QEMU can also adjust device specific ``ioctl()`` calls in a similar
>
> ---
> base-commit: d7a65d1793d691d356a56833620f7d1e6f5d653b
> change-id: 20261006-typos-in-docs-36cfdbbe52d3
>
> Best regards,
> --
> Filip Hejsek <filip.hejsek@gmail.com>
>


