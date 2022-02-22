Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMSV1-0005fP-6X
	for mharc-qemu-trivial@gnu.org; Tue, 22 Feb 2022 05:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nMSV0-0005di-A7
 for qemu-trivial@nongnu.org; Tue, 22 Feb 2022 05:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nMSUy-0006xC-Go
 for qemu-trivial@nongnu.org; Tue, 22 Feb 2022 05:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645526063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7BOtu9wGcWHrHIYra3A0Xc0bF2gc97TUC3em0vjcQQ=;
 b=PuqITJHSIgQgBwShXHuJoYgGy01n+2+PokH7ak4PkzjTJFPQ8h3dXbIIE9y0OLQXaEV2Zm
 8VfZ4nba6qFJSBh9HFrvM66pwujXuo0vcjfm1lO7e1izFUAucffbrc3CoTZNqoG+Dg/jt+
 lueMtKWBDVGNwGoepWODgNO9Enb/Suw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-sqBfQlmIODSC17csrpDEHQ-1; Tue, 22 Feb 2022 05:34:20 -0500
X-MC-Unique: sqBfQlmIODSC17csrpDEHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A78E80573C;
 Tue, 22 Feb 2022 10:34:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C673672190;
 Tue, 22 Feb 2022 10:34:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1804A180079D; Tue, 22 Feb 2022 11:34:17 +0100 (CET)
Date: Tue, 22 Feb 2022 11:34:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 Noah Bergbauer <noah@statshelix.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hid: trivial change to support side and extra buttons
Message-ID: <20220222103417.mf2vw5t7lewmudpt@sirius.home.kraxel.org>
References: <20211126140437.79745-1-noah@statshelix.com>
 <CABjy+RiwQLNmdSYop1zWq40Jp2HRvf_z5xtDTmKT1R3ff0bHdg@mail.gmail.com>
 <CABjy+Ri7Cnnnkn8PqhNwfDeNYo8y526TnTanAwV+DuLZWGQ-9g@mail.gmail.com>
 <610ad47e-b991-1502-5197-cf8040989ed4@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <610ad47e-b991-1502-5197-cf8040989ed4@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 22 Feb 2022 10:34:26 -0000

On Tue, Feb 22, 2022 at 10:32:49AM +0100, Laurent Vivier wrote:
> Gerd,
> 
> if you acknowledge the patch I can merge it via the trivial branch.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

thanks,
  Gerd


