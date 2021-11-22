Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp5AX-0005CJ-RD
	for mharc-qemu-trivial@gnu.org; Mon, 22 Nov 2021 03:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp5AQ-00059o-QZ
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 03:59:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp5AP-0007wF-4P
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 03:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637571552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7JBPrWojL92KcRyqh3aLq5gHKD6z/l+7VCQFe2FDaQc=;
 b=MB5d7hP+f95BDj2Sq1XDXDHHLklv8lC6e8gklJ9st9AakWBQbs0u9jINPAHDSQc4Raf8U8
 SFU+DUfc3jQGxo0jgu9ptnY+2A1X8CjdqCzbWyik2w/d06N72KpQTZOgfHU/qypJH+2klD
 92w6A2BDJdvymeh8qGfiYsq6RdZeyXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-YglnjZURNxamzyG9SwpV0g-1; Mon, 22 Nov 2021 03:59:09 -0500
X-MC-Unique: YglnjZURNxamzyG9SwpV0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D3CA879500;
 Mon, 22 Nov 2021 08:59:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC80C1017E37;
 Mon, 22 Nov 2021 08:59:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0626D11380A7; Mon, 22 Nov 2021 09:59:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Cc: chen.zhang@intel.com,  zhang.zhanghailiang@huawei.com,
 wencongyang2@huawei.com,  xiechanglong.d@gmail.com,  berto@igalia.com,
 eblake@redhat.com,  vsementsov@virtuozzo.com,  qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/2] docs: Use double quotes instead of single quotes
 for COLO
References: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
 <1637567387-28250-2-git-send-email-lei.rao@intel.com>
Date: Mon, 22 Nov 2021 09:59:05 +0100
In-Reply-To: <1637567387-28250-2-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 22 Nov 2021 15:49:47 +0800")
Message-ID: <87k0h0o9ba.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 22 Nov 2021 08:59:15 -0000

"Rao, Lei" <lei.rao@intel.com> writes:

> From: "Rao, Lei" <lei.rao@intel.com>
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


