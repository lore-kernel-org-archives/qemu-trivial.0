Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oqf9g-00036L-Dt
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2022 14:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf9V-0002u0-Fo
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 14:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf9I-0006Q7-9g
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 14:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=SmlY7JaFRtQ/KaYLCF77O1F+XlBStfv8xj4K7pHDVLqRKuqzbxN49rXI4YZS2TcMQOdDah
 ZgACbY3+uFnFwvZC2wCdH5D2cr0Bqx0HBrXwG8pBxKILpJBLmeq4Ebgpn1rOJBOMaEd8p5
 jGlXeRVPTPXU0FNtLrfqpuPGed9pQPY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-zv6URVKANTS-CGxR4JD3ww-1; Thu, 03 Nov 2022 14:40:55 -0400
X-MC-Unique: zv6URVKANTS-CGxR4JD3ww-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp16-20020a1709073e1000b007adf5a83df7so1820286ejc.1
 for <qemu-trivial@nongnu.org>; Thu, 03 Nov 2022 11:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=fXpEIwdvmGvyTgrTXK1vXBfy1NODq1nAZao68HaPRG2TKY2jCMcQJGcxDvDa4mUtab
 wEFwstSFlG/VXK+cD/sKZ6OYoY1ychB/ABDfLt2w64SU8pEdUeuGUvQoitfjFuq6TwVL
 9fsgY8KUR0sArGNq0tHdy4u0NlDo8mqJDufYgPpS3BaZZmbmDzXMKckZ98Bg+orHG4QH
 DsbC5UXCcnyDXl7j/dIOxBp5ZkpaT0WKCRRL7PmzbdgnsHSgtnVKqfVA4KvQ1VijMKAr
 DhvGlLy7WUQCtTtwOcdCwjpDM4PtFZ89e3EjCL6llOA+7LJFM8VYHKDkUl1DXYiyyMYz
 VnSQ==
X-Gm-Message-State: ACrzQf16fFl8EbDzgYU9IAxEMlTEbzAxDFUZfPeptYbRbJ4IEAU+ql2R
 evm+Qyh4bjK3+fcmINqKq2tK+rBCEsBGlwIocr7ICAapW0dGPtdDJPqG8wHYyPBRuYFD5oAyKCG
 AcpZXXSG7hbey0nHJZQ==
X-Received: by 2002:a17:907:78b:b0:741:3d29:33d2 with SMTP id
 xd11-20020a170907078b00b007413d2933d2mr31960145ejb.103.1667500853448; 
 Thu, 03 Nov 2022 11:40:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/cls7dcY+oedsGGvVB/8oFb8Or6Swzb9jyog5hRpaeN8gC7a7QXHhmbDbTH6Wryr7HKBqlw==
X-Received: by 2002:a17:907:78b:b0:741:3d29:33d2 with SMTP id
 xd11-20020a170907078b00b007413d2933d2mr31960134ejb.103.1667500853271; 
 Thu, 03 Nov 2022 11:40:53 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056402000700b00458824aee80sm843803edu.38.2022.11.03.11.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:40:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] Add missing include statement for global xml_builtin
Date: Thu,  3 Nov 2022 19:40:48 +0100
Message-Id: <20221103184048.177105-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103083815.464612-1-sw@weilnetz.de>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
X-List-Received-Date: Thu, 03 Nov 2022 18:41:30 -0000

Queued, thanks.

Paolo


