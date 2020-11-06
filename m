Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kavMn-00012T-VP
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 01:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kavMl-00010C-2G
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 01:36:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kavMg-0007WZ-WC
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 01:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604644606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ac4OdVgQwZBSzTCyiZDUg9So1R3sCXGDWjIdNhFYaMQ=;
 b=EYDHHpwLPYMgOcEs8KSVSB4/22gtU7AKLKwkCarzuOShEnkLDPxTNwCQL7d/U6ZlTATJ4/
 /1/07/NidRmhl5KglZfIQfwUkxOTzguBlxpnXFmH56Rp367I8aXtiIIZx6KwqDVSyejP0y
 AL5SKr+7ePCoohtp21p1aB8IT5SJMoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-AYfBbK2COPWDVqOusN3fqg-1; Fri, 06 Nov 2020 01:36:45 -0500
X-MC-Unique: AYfBbK2COPWDVqOusN3fqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3649879525;
 Fri,  6 Nov 2020 06:36:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D446E70B;
 Fri,  6 Nov 2020 06:36:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A4AB1132BD6; Fri,  6 Nov 2020 07:36:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: AlexChen <alex.chen@huawei.com>
Cc: Thomas Huth <thuth@redhat.com>,  <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  QEMU Trivial <qemu-trivial@nongnu.org>,  QEMU
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH V2] qtest: Fix bad printf format specifiers
References: <5FA3A0C6.5040500@huawei.com>
Date: Fri, 06 Nov 2020 07:36:42 +0100
In-Reply-To: <5FA3A0C6.5040500@huawei.com> (AlexChen's message of "Thu, 5 Nov
 2020 14:50:46 +0800")
Message-ID: <87sg9nouth.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 21:51:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 06 Nov 2020 06:36:55 -0000

AlexChen <alex.chen@huawei.com> writes:

> We should use printf format specifier PRIu32 instead of "%d" for
> argument of type 'uint32_t'.

I prefer v1, which uses %u.

[...]


