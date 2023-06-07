Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6p47-0001kZ-88
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 05:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q6p45-0001jS-8L
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 05:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q6p43-0008DT-Sg
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 05:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YYiAnbjVZOLNlu/qNFDh/UPIwjMpTlny8CB0kphkW78437OlCWBxOg9774v++nL35HvgI/
 +HDbZNjrS86neZwJaYJemc/q2GCzHMH+ZNPzI3oDNS3wEFnf0jwkHy8xKQBI5cVG806wm6
 /cPZKTz6mXFuWZ1NiqSpPrD70JNLZoA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-pP7WxFgUOzyjiVHNNGl5Gw-1; Wed, 07 Jun 2023 05:02:45 -0400
X-MC-Unique: pP7WxFgUOzyjiVHNNGl5Gw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-95847b4b4e7so617784366b.3
 for <qemu-trivial@nongnu.org>; Wed, 07 Jun 2023 02:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128565; x=1688720565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GQgzAEJaAYDiDakMaXm2Vd3GQ7VodA2MNQUUHqDT7bxxnc5OT8eaxCoD42dqvcPEfg
 LcazZpdNC0EV4n54TG1hB6g0RyvX6WCMq9tsHOkqOGF04N68dlQlYYgbFGuCvcwJK4s/
 40lthIM7sYN1miLEt/WuC/iwbj/9N7CpV5kjhJH+SjJFMiRRcfLqWCwD77uGcGO2zFVC
 esu8Wmw8AQlRt5oBKY2O/MoH1S2vD8yh1RzOFlLKHi0j1YUUmulYPhliLCD8XXxc4DKs
 RZ6e7H/dUxp08bjEbz17jcjZEZz1hfhK1Wl/6NZZV/SJtfEp3R3N5OSLsn7qG7CcRwCK
 HfNg==
X-Gm-Message-State: AC+VfDxCGxf/wRD9Og0ntV2KI7ackZld+VjUC4NVlIdpFhCwsBSZYgY4
 tI0pLxc5mUIfmTuIWZqWFQp1UaBAtNMcdGeKMlbh8L4038qIMv8WIFwphIKgzpzvXhJf2eUNMpR
 YqfR8y2mgBn6cZyWaRA==
X-Received: by 2002:a17:907:a0c8:b0:96f:4225:9009 with SMTP id
 hw8-20020a170907a0c800b0096f42259009mr5551640ejc.0.1686128564916; 
 Wed, 07 Jun 2023 02:02:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nzNDzHTaR8heq2rhLkDDve/7gq2VGEPyQj0LM2x6T0/6YKxwUwV9RIW2+zbg8RL0nnyyQXA==
X-Received: by 2002:a17:907:a0c8:b0:96f:4225:9009 with SMTP id
 hw8-20020a170907a0c800b0096f42259009mr5551625ejc.0.1686128564637; 
 Wed, 07 Jun 2023 02:02:44 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170906350600b00970f0e2dab2sm6612620eja.112.2023.06.07.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:02:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] configure: check for $download value properly
Date: Wed,  7 Jun 2023 11:02:41 +0200
Message-Id: <20230607090242.59095-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <3236bc555c76dcd561d38a3aea6e8489e917bc15.1686124161.git.mprivozn@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 07 Jun 2023 09:02:49 -0000

Queued, thanks.

Paolo


