Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUrro-0005kK-HV
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrrn-0005hV-93
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrrk-00027B-Ve
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603201192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=IJMKQ3Ig1+I2YDRYSWqrGJzJdCCrtqnr7evTHjPkArPZUIIxLKHo59LjxNKoaOhIhtwE0b
 tCz+7azT0iOVO9jvhjPfiCc2+CZLtHbZ8M2OJ1zSKJanWk3C0r/fa/YIUM/tAdymBzSadA
 H4dLYVgmipfNiE0nUiQRQURhxCUDUCY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-2bvrQsZDPr-XFjrMy0NdbQ-1; Tue, 20 Oct 2020 09:39:41 -0400
X-MC-Unique: 2bvrQsZDPr-XFjrMy0NdbQ-1
Received: by mail-wr1-f70.google.com with SMTP id j15so832497wrd.16
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=BtOZqgKanhEaJ+MSKyiHkMul7g60sYjgXxUMACe4sQqWsK/QaB768MyXGUk4VKhTZz
 9tr0hSSd7re9ns+aJJ2lj6W0X6dkUbjcSe4cOlXMhQAkuSQfRroC8GMjXZLlaeIwuVOY
 VjSG6mUfBhJxrhYItteJqWg9t23uk9wRfQROSbhSHjl1hEZ9WwmBI0DetnUP3g0MI3+V
 2E+qgSSWDnEm4Wg+iGqR1c4wK/f+50daZlVmTRd+oirEZ6rj1M/rZZccPD9UUCqcVJ/n
 AJYmv/xseLj+QMdeLvbeBN1clcjMIvyzOnexMF16ndzmz1AtzzsLfA5NKIUarlT5WG9+
 Y1dQ==
X-Gm-Message-State: AOAM533p+9IKc2lteq7PKopOZR3dUDuTZP4l0K3045pl0pgXIOOc1KZY
 cXdwEhwI6sRk03PeDII5u3d0Xl7CFzmYT31gCKUwAsnz46lkP+LLd3Y7HLo9kraazG4pCYmNhrp
 KcnAlq7e1PsTevyWzMA==
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr2982191wmf.65.1603201180410; 
 Tue, 20 Oct 2020 06:39:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxKSCkn1DH2hJiSsSPFRlpWYR7I8rQRi7jOVxx10O4cB2vNpI0K/M6q109lDxJnt+iv1PkRg==
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr2982173wmf.65.1603201180214; 
 Tue, 20 Oct 2020 06:39:40 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id e5sm2988171wrw.93.2020.10.20.06.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:39:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 8/8] migration: Delete redundant spaces
In-Reply-To: <1603163448-27122-9-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:48 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-9-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:39:38 +0200
Message-ID: <87tuupaued.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Oct 2020 13:39:55 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


