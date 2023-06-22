Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qCQzT-0003Sb-Hp
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2023 16:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCQzR-0003SD-2v
 for qemu-trivial@nongnu.org; Thu, 22 Jun 2023 16:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qCQzP-0000bq-OS
 for qemu-trivial@nongnu.org; Thu, 22 Jun 2023 16:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687465990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRbqvlBWYGumQVqwLV4mZShX8anD9CsIPAc+LWpKOSQ=;
 b=KiRAJrDGW4OueHFo2VE5aGb54kp9Wqjfkz6YF/Y0D7ZMaJDy+L8Ig3qe++pp2m/lLimaR0
 Bxa1A9nv6PXGt/80o6mkEbBjB07TVUZO4SqV2iLRksHQNlUuxUbUCHdh/zJ0bJfv91OL3+
 U1DFzQQc71uRcg9O24xa3aEZ6/3dcgo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-TWV4VhjAPXKnkgmph9J_dw-1; Thu, 22 Jun 2023 16:33:07 -0400
X-MC-Unique: TWV4VhjAPXKnkgmph9J_dw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fa78e5c806so3021405e9.2
 for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2023 13:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687465984; x=1690057984;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nRbqvlBWYGumQVqwLV4mZShX8anD9CsIPAc+LWpKOSQ=;
 b=ClcmZ4XQhZzQ9lXBi/35MGYlq0an+T4aDiQ+JChCsIGqGKIkUExGEPnXMkl0ZUgYSM
 P34X5drafWEKX7OBBS+RtiI3Z7+LK0WMrK5VnKxXdplhaZehYvnbYeinEbmUF8h29RPn
 rCHl01qZeEAUBwE5bzpn2TrmR9A4/IFb28yFskQ81nJbPwwdn8X+GPG0QuGKEtaLSP6Q
 /Hl++eEldC23wnr/xcqeY4gMvBqQRxlU57zpoMLRs228ut+fNmhq+jkJU8hpjW7eJpcm
 doXO78goFxg5Ht5FAyk5AB3HcwKWWA/l9kLbudQ8szfwrZPmgnHBJREQdC0vL4CT4rPF
 RbGw==
X-Gm-Message-State: AC+VfDxH59rRJFniS4U3OemD+fzoPcYdmTgmej8JFGhfqn4e0trUM+JD
 1s2bC3UEdzlkm289ZKQYGnLld8tJwujVnlyybMrRofDgipYK9cO8q6Bet/w37ZRcQWqQGSaarLW
 ACbSQpSjVOANyt2blEA==
X-Received: by 2002:a05:600c:ad4:b0:3f9:b8b8:20df with SMTP id
 c20-20020a05600c0ad400b003f9b8b820dfmr6352009wmr.33.1687465984762; 
 Thu, 22 Jun 2023 13:33:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zVqUGvFVUQHhKjuoyNvDc9j7dYda9gO8Gqp60QsLnKyeOi3cB1JMJMqmKIiPZYSbDlfkpAg==
X-Received: by 2002:a05:600c:ad4:b0:3f9:b8b8:20df with SMTP id
 c20-20020a05600c0ad400b003f9b8b820dfmr6352002wmr.33.1687465984435; 
 Thu, 22 Jun 2023 13:33:04 -0700 (PDT)
Received: from redhat.com ([2.52.149.110]) by smtp.gmail.com with ESMTPSA id
 e11-20020a05600c218b00b003f96d10eafbsm439765wme.12.2023.06.22.13.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:33:03 -0700 (PDT)
Date: Thu, 22 Jun 2023 16:33:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/4] hw: Minor simplifications using proper QOM getter
 macros
Message-ID: <20230622163249-mutt-send-email-mst@kernel.org>
References: <20230523061207.48818-1-philmd@linaro.org>
 <78d99f7f-33f0-0007-10c7-c78278cde080@tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <78d99f7f-33f0-0007-10c7-c78278cde080@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Jun 2023 20:33:14 -0000

On Thu, Jun 08, 2023 at 09:41:58PM +0300, Michael Tokarev wrote:
> 23.05.2023 09:12, Philippe Mathieu-Daudé wrote:
> > Enforce QOM style. Besides, using the proper QOM macros
> > slightly simplifies the code.
> 
> Applied to my trivial-patches branch (Maybe it's time to resurrect it).
> 
> Thanks,
> 
> /mjt

pci things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


