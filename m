Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s0LJZ-0005Dx-7X
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2024 09:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcasquer@redhat.com>)
 id 1s0Hek-00072M-UH
 for qemu-trivial@nongnu.org; Fri, 26 Apr 2024 05:14:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcasquer@redhat.com>)
 id 1s0Hei-0004IH-AT
 for qemu-trivial@nongnu.org; Fri, 26 Apr 2024 05:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714122845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzqgLx78EvlSfnqx+14UcMQjMPJVBXLZODD/QaXQlmY=;
 b=OMrHTEcvIalog/iFk6j99KqUnCPfG9dnIyDrvBQWCl1KE5g/ZsdewpmcVPK5h7sMAPuJ+h
 MMibD/d7E87mBOM7fiphVfPEaLja5SecCLs647O/dLE5DNa5vgZPrbDnH3zTOpiBNeK1MI
 C/4T5oCdRJhJMK5jg6rs59YYV1od1sQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-nmzqZ8fkNOaHnkqfsMW84A-1; Fri, 26 Apr 2024 05:14:02 -0400
X-MC-Unique: nmzqZ8fkNOaHnkqfsMW84A-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2dab1fc7c16so15633041fa.0
 for <qemu-trivial@nongnu.org>; Fri, 26 Apr 2024 02:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714122841; x=1714727641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HzqgLx78EvlSfnqx+14UcMQjMPJVBXLZODD/QaXQlmY=;
 b=WV9iS4JhK5lUT6k06tnEaZOnRx7F3GeHUVRFffpMjWGIDYnys3amDX1VIluWa30Wlw
 U+Vu/ChSdsavxXItM+nyLn8yakSSKM0uUPkfoEi1K3cWi3qUOgW9BMaBOOcUQ78xwK8x
 LcRYKQ1/QlTTntk2Z0Ed509I4Dt8XgZYE98Qsc+v0MkC2SOnSUUrAZDnWJnbW0rOQlLS
 eyiZqREAjhMeWFXOUPr3VyRAw34VBMcid2UJG5U69i1QsnL7rHVoz83cvBct4KB3j1wL
 eJg28/GpFgTi7eBdJPkta1LGytiC9baZjSQeqqe6FUCBS9+2FfDUHfX/5UpxpdSVw5uP
 r48g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0SPIyM4X4fEXkg3SiP6LjYhSEj6rs9yIyT/6J+Faf/5JXeLwZXfY0yIdngC6E4eN8Ey5408tPYhvYvAP5QAoHdpA41MpEng==
X-Gm-Message-State: AOJu0YxpyLPh2CVdZ2V0F/u954TRC0DYBjy+VsTAF1RFAOLeMAtcu+F2
 gw0j7w3ylPiOwnci6mE+JdfAxW1BW36QXVpAf3lfC1WI3JaNBMHTXntWvO4LB0au9z2AJ405Y22
 d3xLFCRqIFgRxyH98SjcxEaFKyuHOK/OzjlHGgrbep/7mK9JS/IKRLPxFd/meIzIGq0sI7CmxBw
 7s2lpF6rXexBL8ykOM5jqYV65gEl/EuA==
X-Received: by 2002:a2e:bc04:0:b0:2da:6f70:38b6 with SMTP id
 b4-20020a2ebc04000000b002da6f7038b6mr1648965ljf.35.1714122841395; 
 Fri, 26 Apr 2024 02:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9y/HWJwf1jpWocOFqS3oFX2RfA8othwHG4DUsGIedHQiE2uXXpDnExoVy2hS3AZfPwtIikJW4213sCNgc3kg=
X-Received: by 2002:a2e:bc04:0:b0:2da:6f70:38b6 with SMTP id
 b4-20020a2ebc04000000b002da6f7038b6mr1648951ljf.35.1714122841072; Fri, 26 Apr
 2024 02:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240420054606.13353-1-thuth@redhat.com>
In-Reply-To: <20240420054606.13353-1-thuth@redhat.com>
From: Mario Casquero <mcasquer@redhat.com>
Date: Fri, 26 Apr 2024 11:13:49 +0200
Message-ID: <CAMXpfWswsBtuaSXs_pK+-La2qeMrKSSU1JzmP_uCYp3rbxn0vw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Remove useless architecture prefix from the CPU list
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcasquer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.669,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Apr 2024 09:08:32 -0400
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
X-List-Received-Date: Fri, 26 Apr 2024 09:14:11 -0000

This series has been successfully tested in x86. Execute the cpu help
command and check in the list the x86 prefix is no longer present.

Tested-by: Mario Casquero <mcasquer@redhat.com>

On Sat, Apr 20, 2024 at 7:47=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> Printing an architecture prefix in front of each CPU name is not helpful
> at all: It is confusing for the users since they don't know whether they
> have to specify these letters for the "-cpu" parameter, too, and it also
> takes some precious space in the dense output of the CPU entries. Let's
> simply remove those now.
>
> Thomas Huth (3):
>   target/i386/cpu: Remove "x86" prefix from the CPU list
>   target/s390x/cpu_models: Rework the output of "-cpu help"
>   target/ppc/cpu_init: Remove "PowerPC" prefix from the CPU list
>
>  target/i386/cpu.c         | 2 +-
>  target/ppc/cpu_init.c     | 9 +++++----
>  target/s390x/cpu_models.c | 9 +++++----
>  3 files changed, 11 insertions(+), 9 deletions(-)
>
> --
> 2.44.0
>
>


