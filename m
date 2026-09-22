Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7184C982FA
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 17:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x94NJ-0006F0-Tq; Tue, 22 Sep 2026 13:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94NI-0006EA-Dg
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94NG-0006nC-Uz
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790098426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi+qvRAas+uFJKuqkVBomroa/mxGDCtc3HMUOajhkRU=;
 b=e6ctyzyMno2AcBaAGMJl3rsQ3sH06BJnrVfRJ7cxYBqcG96co38BP4lszx4C/pluwDt5x4
 pcNQnvSPedn2uLFHCUPS5jXWKyHCb+W2t7UmV0Kln3haSxyUI1J9PXSJ7yDDM+eAX1gGBA
 ceSIDOhB4MmV04Bj78IvDEUF0IBSJww=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-fpe7Aje-NRGVhPXn35jcBA-1; Tue, 22 Sep 2026 13:33:42 -0400
X-MC-Unique: fpe7Aje-NRGVhPXn35jcBA-1
X-Mimecast-MFC-AGG-ID: fpe7Aje-NRGVhPXn35jcBA_1790098422
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-66f92d36b8bso98557d50.1
 for <qemu-trivial@nongnu.org>; Tue, 22 Sep 2026 10:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790098422; x=1790703222;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Pi+qvRAas+uFJKuqkVBomroa/mxGDCtc3HMUOajhkRU=;
 b=S/IcolbveUSlXUYxjzcT/OfnjImOBEU0CTuAVdmMsuU7rjqSwFL70liNCA/+4jcHS2
 uAoIXE4QvkiqV99jBNTxPcZGxrfRSUpMlL3fJEemJ8qu58UBjUTAByHJQtL6Ha537Y5D
 m7Dr983x9v0EZcXhnIpmwbY8sNSjq7Pp28Li0UdY+SNvX8TGMsedqyq+TdPR7JGJAjay
 r7Mf8wO89e1O2S3lcWURYci0RJJYRNInc6GccH987pKNoz/meZAL9K+DKpq2atpEcTPb
 l6mMH6gJfFJoOkFIEzTbFTDk9uQokDV+kMtxoy6TcKsHsAQbUNH8BjG+NBVm25qDk/cH
 gTNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqVV9qQSnP4lscVUV+leZCuMpXXNFo2rxbR0x9kCUY6NIZ64JCnoEkaFPC2zoeAqvIpoHuHYO4zDiDKng=@nongnu.org
X-Gm-Message-State: AFuF++nc+gOiw3YEVsrWQag5bYuchl3fcTRvkwcxFjkWC+by9Ngb0h+m
 bKEcMXIseM4Fuwg4q2fS9i41axuzqRBqO9Rll/5+whr2JxxSPXAAphPMkNBJqXmSva72hON75Pa
 Z4ISNforVvRVs2GX83TUDRfhLxJurXhWf8VlkUGIy7UU8dGRYdVu1A3+tQqUdoh8+PfrasNZgpo
 43N8dDM/UBlgZ0RBG8BKKdaBk+CbcXhFbQTjFZytcJHA==
X-Gm-Gg: AYBFou3IEz8yPYWQSG95C/dvhv11oF+gFIdc/tAUU9yRAy1Is1vLJKybexA01r6sksV
 OIOP2Zl2YCVrKe1HsegdRayCSfYp5PwJGu04qxQFC/eBwNNiU9ZZAohgGk7kaMawVIZqjwfyLKw
 YAj91nZWRLXCtRXOeK2zNLYIU1kakcy464HmuJwMm0TIzRLRJmnDfHvgo/xn7v0kmbb9K4bUibd
 Od1NbSojUdPwhf2
X-Received: by 2002:a05:690e:2417:b0:672:a52c:daf6 with SMTP id
 956f58d0204a3-672d598af82mr121483d50.105.1790098422105; 
 Tue, 22 Sep 2026 10:33:42 -0700 (PDT)
X-Received: by 2002:a05:690e:2417:b0:672:a52c:daf6 with SMTP id
 956f58d0204a3-672d598af82mr121461d50.105.1790098421508; Tue, 22 Sep 2026
 10:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260921205147.1857168-1-jsnow@redhat.com>
 <20260921205147.1857168-6-jsnow@redhat.com>
 <87a4p949td.fsf@pond.sub.org>
In-Reply-To: <87a4p949td.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Sep 2026 13:33:29 -0400
X-Gm-Features: AcwNN1VJths39qZrc4v0LUEU6RbXIedhUY2La6Vrx-msYZq7nYVB99cKcqeO0nk
Message-ID: <CAFn=p-aj_EzNGKLb8vs3zSht2gdt2B3o2v8GsthcKfhjHLUfBg@mail.gmail.com>
Subject: Re: [PATCH 5/9] qapi: split intros at natural cutoff points for
 qga/qapi-schema.json
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kashyap Chamarthy <kchamart@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KaVIaAJnBb_A9NIdvxUnTrGQfP0kV6toyFmZt7FAOUE_1790098422
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On Tue, Sep 22, 2026 at 10:53=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Note that these intro conversions introduce a new intro/details split
> > point. This new split point may or may not change the rendered output
> > depending on if any documentation is generated for this definition.
>
> Uh, we generate documentation for *all* definitions.

I meant ... generated from the definition itself and inserted. We
don't "generate" documentation for every doc block.

>
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  qga/qapi-schema.json | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> > index b592b14a011..19b0958b84e 100644
> > --- a/qga/qapi-schema.json
> > +++ b/qga/qapi-schema.json
> > @@ -401,8 +401,7 @@
> >
> >  ##
> >  # @guest-fsfreeze-status:
> > -#
> > -# Get guest fsfreeze state.
> > +#     Get guest fsfreeze state.
> >  #
> >  # .. note:: This may fail to properly report the current state as a
> >  #    result of some other guest processes having issued an fs
>
> This one does affect rendered docs: the auto-generated Returns moves
> from below the note to above, where it belongs.
>
> > @@ -925,9 +924,8 @@
> >
> >  ##
> >  # @GuestNVMeSmart:
> > -#
> > -# NVMe smart information, based on NVMe specification, section
> > -# <SMART / Health Information (Log Identifier 02h)>
> > +#     NVMe smart information, based on NVMe specification, section
> > +#     <SMART / Health Information (Log Identifier 02h)>
> >  #
> >  # TODO: document members briefly
> >  #
> > @@ -1816,8 +1814,7 @@
> >
> >  ##
> >  # @guest-get-load:
> > -#
> > -# Retrieve CPU process load information
> > +#     Retrieve CPU process load information
> >  #
> >  # .. note:: Windows does not have load average API, so QGA emulates it
> >  #    by calculating the average CPU usage in the last 1, 5, 15 minutes
>
> These don't.
>
> A possible commit message correction:
>
>   Note that these intro conversions introduce a new intro/details split
>   point. Only the first one affects the rendered output.

Sure.


