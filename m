Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7Yxd-0001Mp-BO
	for mharc-qemu-trivial@gnu.org; Mon, 17 Aug 2020 02:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7Yxb-0001LC-Uj
 for qemu-trivial@nongnu.org; Mon, 17 Aug 2020 02:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7Yxa-0007kF-Dt
 for qemu-trivial@nongnu.org; Mon, 17 Aug 2020 02:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597646973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qSNqbd8xdlm+KvS2CRU8j/CZdv8Su5c3Xq64Mqa9GRc=;
 b=X1DJwZUurvPK/FDhAzmgk1uJ9j1TI0/f+85TJlxS+G6jFaVlL50eNL26+M4nStWaFv45Lq
 ABQ5n8pmQPJ+fNuxL+K1/qMFEtcfJKTJsq3uAwIlBWjo00sKdh61lXptagLXy1D6E9r11w
 r0uN/pK0dtQ/Xi4f6KhR4T7vTOvsrlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-ey04bhYBMfek47yz1D7QWg-1; Mon, 17 Aug 2020 02:49:31 -0400
X-MC-Unique: ey04bhYBMfek47yz1D7QWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CE0E81F007;
 Mon, 17 Aug 2020 06:49:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 380E3100EBA5;
 Mon, 17 Aug 2020 06:49:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 121FC1753B; Mon, 17 Aug 2020 08:49:29 +0200 (CEST)
Date: Mon, 17 Aug 2020 08:49:29 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Subject: Re: [PATCH 11/11] hw/display/vga:Remove redundant statement in
 vga_draw_graphic()
Message-ID: <20200817064929.4ankvfxxiqa4adgo@sirius.home.kraxel.org>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-12-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-12-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 02:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 06:49:36 -0000

On Thu, Aug 13, 2020 at 03:37:12PM +0800, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/display/vga.c:1677:9: warning: Value stored to 'update' is never read
>         update = full_update;
>         ^        ~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


