Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3b41-0006Fz-VP
	for mharc-qemu-trivial@gnu.org; Thu, 06 Aug 2020 04:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3b40-0006Ec-Fu
 for qemu-trivial@nongnu.org; Thu, 06 Aug 2020 04:15:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43380
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3b3y-0006fg-Tn
 for qemu-trivial@nongnu.org; Thu, 06 Aug 2020 04:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596701746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MjckzVvdsKfi+y5p1QtuTFEy63WQh9uqlnnZ8n5lxo4=;
 b=b+ll+78HIZGaaCBkuHgjnH50gkYXdXt7d8kWaArDrlrJ/1Y5ypi8vqHsszJC2XxMy80TXa
 88FmXHvoCDpeUQrEOX3BoAOifRoKfNLTJUz1h288YFiSgIZCx97kv/SnlxMuBDI6+VOa4Q
 JzFKatgGS+VYBf/ixoSGelXONSi/h2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-jIH1gUGpM1C2rje13V32Qg-1; Thu, 06 Aug 2020 04:15:43 -0400
X-MC-Unique: jIH1gUGpM1C2rje13V32Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06E53100AA21;
 Thu,  6 Aug 2020 08:15:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 912055FC36;
 Thu,  6 Aug 2020 08:15:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 269A81132801; Thu,  6 Aug 2020 10:15:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] docs/qdev-device-use: Clean up the sentences related to
 -usbdevice
References: <20200710065520.24784-1-thuth@redhat.com>
 <87r1te79va.fsf@dusky.pond.sub.org>
Date: Thu, 06 Aug 2020 10:15:37 +0200
In-Reply-To: <87r1te79va.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 14 Jul 2020 10:56:41 +0200")
Message-ID: <87sgd08a1i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 08:15:48 -0000

My review came too late, so I turned it into a followup patch:

Subject: [PATCH 3/3] docs/qdev-device-use: Don't suggest -drive and -net can do USB
Message-Id: <20200806081147.3123652-4-armbru@redhat.com>


