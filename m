Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqorr-0000nY-DF
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2023 02:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qqori-0000mG-2Z
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 02:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qqorg-0002jp-NO
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 02:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697090888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ESzvRQfFl9gdeLrj8rjrPuAi/wAcoajmQJQ4ezUNBAU=;
 b=Gui6jWJT63wb3zEu9B1kzPoIyYCJunm8z8Plh0chhcTUDlIDwRo5npI4xI6dXRp1HgIhjr
 YH1W9kvchymNo2iQt5VbVHKmwe029h/saLdr8hWQGEOowIrYWCtH/p4eqAxzyrXz11UzK/
 whAz5BQ2+Qxi+JtnhGgOUR2wQtDuwic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-_DDQRLlBOiWCDk32Sjm2rw-1; Thu, 12 Oct 2023 02:08:03 -0400
X-MC-Unique: _DDQRLlBOiWCDk32Sjm2rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 873AE8032FE;
 Thu, 12 Oct 2023 06:08:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65AD51C060AE;
 Thu, 12 Oct 2023 06:08:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FE4C21E6904; Thu, 12 Oct 2023 08:08:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] libvhost-user: Fix compiler warning with -Wshadow=local
References: <20231006121129.487251-1-thuth@redhat.com>
Date: Thu, 12 Oct 2023 08:08:02 +0200
In-Reply-To: <20231006121129.487251-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 6 Oct 2023 14:11:29 +0200")
Message-ID: <877cnsnzjx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Oct 2023 06:08:13 -0000

Thomas Huth <thuth@redhat.com> writes:

> Rename shadowing variables to make this code compilable
> with -Wshadow=local.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued.  Thanks!


