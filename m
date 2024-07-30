Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sYd0Q-000897-HO
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2024 22:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1sYd0P-00085R-7a
 for qemu-trivial@nongnu.org; Mon, 29 Jul 2024 22:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1sYd0N-0005dc-NB
 for qemu-trivial@nongnu.org; Mon, 29 Jul 2024 22:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722308066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYYbtEJSznN0kMOTZDsE/z3W01PWc60CVmaxsTqLfd4=;
 b=eebc1UD5vAbvQtb1Dml5bl3/Iml5dUfmuBddef/a/YbJmFv6+FewJP0i7pKhTM+vHKG/4n
 u0C99hPfIyKLh++8Hsu/V4wvST2OZWCCRk7CWnArwWvZ2EjReeGuEqYSAeTADGQ/ry6did
 OXYTj7v7A6cmfM/Ttv7slVLDgl1apLs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-mD_GGRAcNDWGOZiL4tam3w-1; Mon, 29 Jul 2024 22:54:20 -0400
X-MC-Unique: mD_GGRAcNDWGOZiL4tam3w-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-70e97ac260eso3885699b3a.2
 for <qemu-trivial@nongnu.org>; Mon, 29 Jul 2024 19:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722308059; x=1722912859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AYYbtEJSznN0kMOTZDsE/z3W01PWc60CVmaxsTqLfd4=;
 b=goxerzCWXhi9dccku6LlONiOAuf1iACrYO9mcwGRUAvazDWCCkaLIWiSskKeqYvuqL
 1caBHemSX3B3cvU3Y23xkcPKsVi3r99JL+Vh8NC/PAETg/QgxU8jdEr5WXI+Smbo4fna
 zTdgyzq1VaUc2Fmm2UvUz99yCybOIqEygPD9Iv1uKiAJkuCyX5ZcW84t8GG8hQxM2kk1
 mcW7xSARpshySxmsU/x0txJTB6tAKjZ+Q9tEw7iamPfaUHvSc0uW/71FfCAxvC0Cggfi
 TrvjIsSNGYPSazHasRVN+VEbjajO/ILRab9/YZjxMnMQ5D7LVFOfE84LIUd0T8vHNFkc
 GEVA==
X-Gm-Message-State: AOJu0YzD8VBdVeRBN73bSXIZ7HC0uJvlaChnKLGoZxV9QAskEeciaDrn
 Dfh+uA/YYOvZW169NlSHWWx2DjoEBLxE4YgFlYzelJonh47JnB8ohDFNu+RbpEAwC3uJNTXqMcG
 6LgQVXsEJk+LRrr5RTUjXwTiup4sd64qxDHEpcBo4nrQXsPesjXYEBwRli9umj8OL+mHbo8f+qY
 93ifPFrWdqlRpSXsMvhNlgX4VQPSPFsuxOxCsgHybt
X-Received: by 2002:a05:6a20:9190:b0:1c4:819f:8e0c with SMTP id
 adf61e73a8af0-1c4a117948emr8629963637.6.1722308059131; 
 Mon, 29 Jul 2024 19:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxXVIvtXgZQaMgDtJTwZSUq5Qbj4igFiyhU6Ik5ArQAhvGKnTdyAqTRGAJOVDqIsHtwz+pbgP966ipOsttHmQ=
X-Received: by 2002:a05:6a20:9190:b0:1c4:819f:8e0c with SMTP id
 adf61e73a8af0-1c4a117948emr8629949637.6.1722308058680; Mon, 29 Jul 2024
 19:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240708092630.2596945-1-zhao1.liu@intel.com>
 <ZpdlQDIjGp4wR8aR@intel.com>
In-Reply-To: <ZpdlQDIjGp4wR8aR@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 30 Jul 2024 10:54:07 +0800
Message-ID: <CACGkMEsGyKb932T_AJ63sWFObYSJRvghTYywvbDT0BpVV-c9Vw@mail.gmail.com>
Subject: Re: [PATCH] doc/net/l2tpv3: Update boolean fields' description to
 avoid short-form use
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 30 Jul 2024 02:54:29 -0000

On Wed, Jul 17, 2024 at 2:15=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> Hi Jason,
>
> Just a kind ping. Does this update satisfy you?
> Since the original example generates the warning.
>
> Thanks,
> Zhao

Queued.

Thanks


