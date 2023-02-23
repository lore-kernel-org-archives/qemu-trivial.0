Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVA3m-0000kq-IX
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2023 06:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVA3k-0000kG-A6
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 06:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVA3j-0008Mn-1E
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 06:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677152806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cIioYb5LjQ/daryKNllG2jbcb1XBTBcBZCWFwLTgJSI=;
 b=GlDU0fsBXJ3n6w/4auURHvzj5MRR2ubCbJIH2uaSRPkzVDeaTEGfmVO6c+PNikekxz/aUs
 sq5G6RdEMOUvnzqMdDkJLBvN2T47E9Rc4ZbDYQrwKYkcWLI/bldF4SiDgfs7uwNHQTTOwf
 BEajHfeTBdztw0ltF6ki7s4ZhrdBq8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-lXsHU9kVNtmjp3SOmR-mGQ-1; Thu, 23 Feb 2023 06:46:42 -0500
X-MC-Unique: lXsHU9kVNtmjp3SOmR-mGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 457FD1C29D46;
 Thu, 23 Feb 2023 11:46:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A12640C945A;
 Thu, 23 Feb 2023 11:46:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD67821E6A1F; Thu, 23 Feb 2023 12:46:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,  pbonzini@redhat.com
Subject: Re: [PATCH] meson: Avoid duplicates in generated config-poison.h again
References: <20230206102037.3621709-1-armbru@redhat.com>
Date: Thu, 23 Feb 2023 12:46:40 +0100
In-Reply-To: <20230206102037.3621709-1-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 6 Feb 2023 11:20:37 +0100")
Message-ID: <87o7pkd2ov.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 11:46:49 -0000

Nominating for qemu-trivial.  Thanks in advance!


