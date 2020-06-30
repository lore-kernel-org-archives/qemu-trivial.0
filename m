Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqIUr-0006eO-TN
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqIUq-0006cI-7i
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 11:48:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31236
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqIUo-000564-AH
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 11:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593532109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZdqAzsWwawS+olvAAUNItPD6bp8kPtVOSiNxAkxq7Q=;
 b=A4uumEOxsu1c0fPSMef/b/ykoQUJTPfgU+vC23o9Zt9YLwLfaHLQ0HxuI49OigZKvMZZL5
 FwPUVBHVPVloFXeDiry0bX2FN8T3QInyvb3QwmZF4YrbJXhRJf7dDYHPeWe1oq2wEQEiZs
 DXBt6H0A2svPI7Vk6Lmst6xixtR/Ge0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-KfH9Re9sNV-YYVC_Z2Bl-A-1; Tue, 30 Jun 2020 11:48:28 -0400
X-MC-Unique: KfH9Re9sNV-YYVC_Z2Bl-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00FF3EC1A6;
 Tue, 30 Jun 2020 15:48:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A33E99CFF1;
 Tue, 30 Jun 2020 15:48:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7247617444; Tue, 30 Jun 2020 17:48:25 +0200 (CEST)
Date: Tue, 30 Jun 2020 17:48:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: David CARLIER <devnexen@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
Message-ID: <20200630154825.k7ut6m3trfhwlmas@sirius.home.kraxel.org>
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
 <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
 <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
 <a482bd09-28c8-7de7-de06-dba60d1c8160@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a482bd09-28c8-7de7-de06-dba60d1c8160@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 15:48:32 -0000

On Tue, Jun 30, 2020 at 10:46:59AM +0200, Philippe Mathieu-Daudé wrote:
> On 6/30/20 10:23 AM, Gerd Hoffmann wrote:
> > On Tue, Jun 30, 2020 at 08:44:24AM +0200, Philippe Mathieu-DaudÃ© wrote:
> >> +Gerd
> >>
> >> On 6/29/20 11:48 PM, David CARLIER wrote:
> >>> From 157a0374093371719de42e99364352d64190f52a Mon Sep 17 00:00:00 2001
> >>> From: David Carlier <devnexen@gmail.com>
> >>> Date: Mon, 29 Jun 2020 22:20:06 +0000
> >>> Subject: [PATCH 7/9] Skipping drm build, unsupported.
> > 
> > --verbose please.
> 
> David has difficulties understanding how to send patches,
> so you missed the cover/context. This is for the Haiku OS
> which apparently is POSIX.1-2001 compatible.

That doesn't explain why he thinks this patch is needed.
It should build just fine on Haiku ...

take care,
  Gerd


