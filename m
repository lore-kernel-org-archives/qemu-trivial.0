Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sXAcM-0007gE-Na
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2024 22:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1sXAcJ-0007fB-Pf
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2024 22:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1sXAcH-0003IH-3f
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2024 22:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721960611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5uMHF2+m9Y1bqB89q949ETCM6D8KnKNF0yiL5OsN/bE=;
 b=MyQEC5sELv36+RoZdZzMfTtKymDEqghfI+2vlCVrVPtczAjV5JZPckvYrbEF+arwYcf8ox
 uBFe5HGmdRNywEY6/OfUXp0xrKWLLGMfXIZYep8fW+MVXTB1TycDVej4vK5vv1PUByhNG5
 /l0d6xcdoQsCN+efuZ71UqRVi87c9+4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-zZM-C83YOb6d2N8uV6U25g-1; Thu, 25 Jul 2024 22:23:29 -0400
X-MC-Unique: zZM-C83YOb6d2N8uV6U25g-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-49298183eefso1799847137.1
 for <qemu-trivial@nongnu.org>; Thu, 25 Jul 2024 19:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721960609; x=1722565409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5uMHF2+m9Y1bqB89q949ETCM6D8KnKNF0yiL5OsN/bE=;
 b=DeyjAkSLhllwfbB5pmWAEBwmQjU+DmZS7WRDmXdXLp+OvSRNX77smQXKF4X6Y85qps
 fEiYdGPVa7+D0lUq0230Nvb47QCoptSHcnLHrpuTcXLj/jP4mx7YXoDNC/vL5WiaTGkC
 ND/ZIh9/Ezw5aoAbkv/0iofBc7o8dyxCZWrevWyHF5G1HzqtQLQNwF4jSpu/wuZH8sFr
 3gTvewtyhUS+WZVId6SlIAXLzv0vZXpxH1EzCNY4nJ4N9NSjPYhE/T3Av0FziOUbq8bc
 zbPKQKE2T4OYE6s5PBk2bD9R8KH3YVEMhxZzA/nQaWRJVRN9OcPQ5zMURmPXY4edSdht
 hq9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzMN3OHXn0BmGROJlow0Zod09nitSRqfDlF1VBZsDlwJ8Kl3Qurv/VyJ8krSIQrF05kh+KHcwHFRVp/DvffnuA706xyQugEw==
X-Gm-Message-State: AOJu0YyY8TPVdaeZ+E36WV7RdwOFBAozHbrm//9Bp/M2Hymjp+RMFF0/
 f3quxnSUYhb2Y+82ATjlw1C+0aR01Oc8Chi2CT+rqXJV03Idz8YSoZpFPC3JuM8IfoqsyLZqusL
 z/Sm4mhBhBMAXx7u2QJuCEqPog0VrcqX+turdZjtUTc1LXtnAwAWSyVaqAgfvT67++cje/CtuEJ
 GzMfwgi0lbdNe80Xyx9+0GkboO+WmC7w==
X-Received: by 2002:a05:6102:2927:b0:48f:3b56:a184 with SMTP id
 ada2fe7eead31-493c5a0d8c9mr5678731137.5.1721960609150; 
 Thu, 25 Jul 2024 19:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmL91ooCjnYz6qfBIHuvtrMfAbCRvx1HBQtSYIY8SsntMUWjtVM+NkzKYd/vX489euDKWoZ5Kag6vWMImF7j8=
X-Received: by 2002:a05:6102:2927:b0:48f:3b56:a184 with SMTP id
 ada2fe7eead31-493c5a0d8c9mr5678726137.5.1721960608749; Thu, 25 Jul 2024
 19:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240704124834.81958-1-lvivier@redhat.com>
 <58363488-4058-4470-8bda-5068381712bb@redhat.com>
In-Reply-To: <58363488-4058-4470-8bda-5068381712bb@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Jul 2024 10:23:13 +0800
Message-ID: <CACGkMEvdt3SaOb6=SDYiRoR1xhcbJhr0Q_01m_UqZiyTZJNfPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] net: update netdev stream/dgram man page
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 26 Jul 2024 02:23:36 -0000

On Thu, Jul 25, 2024 at 2:49=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> On 04/07/2024 14:48, Laurent Vivier wrote:
> > Add the description of "-netdev stream" and "-netdev dgram" in the QEMU
> > manpage.
> >
> > Add some examples on how to use them, including a way to use
> > "-netdev stream" and "passt" in place of "-netdev user".
> > ("passt" is a non privileged translation proxy between layer-2,
> > like "-netdev stream", and layer-4 on host, like TCP, UDP,
> > ICMP/ICMPv6 echo)
> >
> > v2:
> >    - split patch
> >    - update unix socket description with stream and datagram words.
> >
> > Laurent Vivier (4):
> >    net: update netdev stream/dgram man page
> >    net: update netdev stream man page with unix socket
> >    net: update netdev dgram man page with unix socket
> >    net: update netdev stream man page with the reconnect parameter
> >
> >   qemu-options.hx | 189 +++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 189 insertions(+)
> >
> ping
>

Queued.

> cc: qemu-trivial
>

If trivial maintainer want to take,

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


