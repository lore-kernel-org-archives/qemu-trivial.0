Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSKzT-0001wX-FJ
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2023 11:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSKzR-0001v6-GE
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 11:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSKzP-0004vg-UP
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 11:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676479838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJElrQ+SaBs2pWz1TyIluKMvkuy1aSWNqwkbjvufUgc=;
 b=SGBJNIL2Z/J2R4nqyr2OLl077jE2iC2BqTR440gTn3K58066c9Qt0dWf/gQyZuax36fZsH
 i8PcOC5SOWGPSNXo90wTo/hOswuGc86GU2rO7Uyj/TVg5aACX81kaPRlb5lW+BmIgjcc6q
 ACemPpCYPwDev2wMPq8w8X4Ng+Uuj0s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-AFQqA_T6PdqQrRN99QV2Yw-1; Wed, 15 Feb 2023 11:50:36 -0500
X-MC-Unique: AFQqA_T6PdqQrRN99QV2Yw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j37-20020a05600c1c2500b003deaf780ab6so1425285wms.4
 for <qemu-trivial@nongnu.org>; Wed, 15 Feb 2023 08:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PJElrQ+SaBs2pWz1TyIluKMvkuy1aSWNqwkbjvufUgc=;
 b=JQCP9UmgwsvqsJNtpfbOyT/IHu2JmpgV5jAgOsfN2xao+161azdLy1RIAAZb3RCjNI
 9uug5rz1o0PyQe6hpS8RIIMZp+Ghgr253eJKft1dHpRAwzPmG5Op7szDnxm/fDh3dm1Y
 bq0uDPPC/be6n+NabIAhzA0C0pobZgZEh6UvDxF5IucYkQOnM2TADk5BN0a6FPV0oIb5
 v8ig8HB2Antp/o33Bt/5lHZ2kafL5xfY85xwv1gbsMUZt3lMmJeqN3Wk2NwGJ0uHHLK5
 ASYo5pkuR4/PVp7GGRxAinGXxC5aCKKWB0jTJYEJAnlTekc6LoYwNKDLctJ0bawr1uxV
 AQbA==
X-Gm-Message-State: AO0yUKUbfC5nnD3YxxSOe3bY7gyaswLw3g52fAE6IEIqsPtORCsBT2SD
 CW6AXTiOBHfg586Jx1GgFKm//WzIU9DUIOLNxsHCQEmSlqWnQaBOy4NFH9tz0d6J1y1QSiHrqnj
 00u8RFJj26bUWCZQbVw==
X-Received: by 2002:a05:600c:747:b0:3dc:5baf:df01 with SMTP id
 j7-20020a05600c074700b003dc5bafdf01mr2388282wmn.5.1676479835560; 
 Wed, 15 Feb 2023 08:50:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/w7LQlPPrgQJUJtU9Bzy/CRgVEH5jmJSwTETkM8O31vWDXotKhGTVKFzwfbsJTjTH9DEZNKg==
X-Received: by 2002:a05:600c:747:b0:3dc:5baf:df01 with SMTP id
 j7-20020a05600c074700b003dc5bafdf01mr2388265wmn.5.1676479835323; 
 Wed, 15 Feb 2023 08:50:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003dff870ce0esm3054704wmq.2.2023.02.15.08.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 08:50:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Fam Zheng
 <fam@euphon.net>,  Stefan Hajnoczi <stefanha@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH] migration/block: Convert remaining DPRINTF() debug
 macro to trace events
In-Reply-To: <20230215153517.30732-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Feb 2023 16:35:17
 +0100")
References: <20230215153517.30732-1-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 15 Feb 2023 17:50:32 +0100
Message-ID: <87r0uq27qf.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 16:50:41 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Finish the conversion from commit fe80c0241d
> ("migration: using trace_ to replace DPRINTF").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

Thanks.


