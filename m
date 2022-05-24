Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntREq-0002c0-9L
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2022 05:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntREl-0002YT-Cn
 for qemu-trivial@nongnu.org; Tue, 24 May 2022 05:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntREj-0000jz-Rm
 for qemu-trivial@nongnu.org; Tue, 24 May 2022 05:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653386037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WEmDBhJaXFxFwgITxbhTG6L4jz8ONd9JIC+h67CF6lw=;
 b=ak6lBqOTdJ7Ovbb3Ccv8KLKpd1IBUryNHApmBm3dPVzCFbr10fVH1DtwLxt51PkBYc1j2U
 aKzDoiL8jtf3cELkhAtBR4ejL7qJsiW0B+67HdrZ0oGm3778f72zxNTGawqQ8BEY7rF6rd
 tybUAOnISbK+mO1M+gl+kXYQkQQ9ifk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-bZSjXxGENha08bdiDmBgXw-1; Tue, 24 May 2022 05:53:52 -0400
X-MC-Unique: bZSjXxGENha08bdiDmBgXw-1
Received: by mail-ej1-f69.google.com with SMTP id
 bt15-20020a170906b14f00b006fe9c3afbc2so5835085ejb.17
 for <qemu-trivial@nongnu.org>; Tue, 24 May 2022 02:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEmDBhJaXFxFwgITxbhTG6L4jz8ONd9JIC+h67CF6lw=;
 b=j71RqSpKbPQa93Rh9DF7xXp1KnscgfbMlX1bDFclmyYTiNywYTZidB3nqIzVypraQH
 3+p7DFz7UhuVoHUgmWYnaQzbyl9sfsQ+NnEn25WJyO6GLZJlZpO0O5uu6DU56LfVLEeg
 dmkGgY0iQM9NIdBm1vw+qOU7JrnEU9J7fTP7MOHgAS4ezJOSVu4qYaONAAZaceuvP66T
 SnfkDZn8c1293Q9moy7hQSIERCCvnQ4jkn9tUFj9EJ83hIEqRognzNSDhuGR+7AhzyFy
 OywtkgyJAy8vI5BMiEvLnAT7fPut2qkHdffNFhC5X6Ffh3xGN4TTym4Vo7Q5ScWzs++S
 vKWg==
X-Gm-Message-State: AOAM533wLezI7XNM/wJaAvSEjysNO7ENKxjHDKkzNMunBGCWGkwYao5z
 aZjhHun97uGc+gNa4Kde0V5z5vHbqJqrdIrzZTv1KVTvMs9KuU2/d6EMDA9M2MM0a5DSsWLvBmM
 O1tGecf3En8EUTb8Mgw==
X-Received: by 2002:a05:6402:4020:b0:42a:d19f:88df with SMTP id
 d32-20020a056402402000b0042ad19f88dfmr27971566eda.56.1653386030825; 
 Tue, 24 May 2022 02:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBaZwrdEasSDDk+d/JnCdMVWCJhQIIGS0x+xE7bcTwfEslDCUVvDKgSB/O+ZGKQfX0M/q0+A==
X-Received: by 2002:a05:6402:4020:b0:42a:d19f:88df with SMTP id
 d32-20020a056402402000b0042ad19f88dfmr27971544eda.56.1653386030529; 
 Tue, 24 May 2022 02:53:50 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906004900b006f3ef214db5sm6972674ejg.27.2022.05.24.02.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 02:53:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 "open list : IDE" <qemu-block@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] ide_ioport_read: Return lower octet of data register
 instead of 0xFF
Date: Tue, 24 May 2022 11:52:28 +0200
Message-Id: <20220524095227.396329-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520235200.1138450-1-lkujaw@member.fsf.org>
References: 
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 24 May 2022 09:53:59 -0000

Queued, thanks.  The same change needs to be done in hw/ide/macio.c:

diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index f08318cf97..1c15c37ec5 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -267,7 +267,9 @@ static uint64_t pmac_ide_read(void *opaque, hwaddr addr, unsigned size)

     switch (reg) {
     case 0x0:
-        if (size == 2) {
+        if (size == 1) {
+            retval = ide_data_readw(&d->bus, 0) & 0xFF;
+        } else if (size == 2) {
             retval = ide_data_readw(&d->bus, 0);
         } else if (size == 4) {
             retval = ide_data_readl(&d->bus, 0);

while (unintentionally) hw/ide/mmio.c already works fine.

Paolo



