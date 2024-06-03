Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sE3Iz-0003GI-Vw
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2024 04:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sE3Ix-0003Fb-Qt
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 04:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sE3Iv-0002KT-BW
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 04:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717404272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wJUXvNhRMqBqfqb25jLGhqzSKH5XYAv3TIGqsziQ8eg=;
 b=iQYhNrxp8cFYXFxNmIivsDB5Uf/23r2rNgNyWiDZKQSAkg+AXz9R+R4iV+cFnW2vw5iOgK
 JRb65Nmsp0H6xVf1a4d5OJ24VTeHqPCc+I4/aOWf45wJfy65m0KL4tvbnqNe76wLHt4QgM
 4SFuVCXNiMzsOgTYpjDZOqCW/nDEv0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-vnd4G63EPPyVyzo2UPPx4w-1; Mon, 03 Jun 2024 04:44:27 -0400
X-MC-Unique: vnd4G63EPPyVyzo2UPPx4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA0298058D5;
 Mon,  3 Jun 2024 08:44:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A289D1C0654B;
 Mon,  3 Jun 2024 08:44:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8464C21E6757; Mon,  3 Jun 2024 10:44:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>,  Zide Chen <zide.chen@intel.com>,
 qemu-devel@nongnu.org,  pbonzini@redhat.com,  mst@redhat.com,
 cfontana@suse.de,  xiaoyao.li@intel.com,  qemu-trivial@nongnu.org
Subject: Re: [PATCH V2 1/3] vl: Allow multiple -overcommit commands
In-Reply-To: <4d9c15c6-cfe7-4535-b41a-fbfcb1e5f970@redhat.com> (Thomas Huth's
 message of "Fri, 31 May 2024 06:57:31 +0200")
References: <20240524200017.150339-1-zide.chen@intel.com>
 <20240524200017.150339-2-zide.chen@intel.com>
 <e86c1913-a1ff-4c31-9915-d66c269b7e10@redhat.com>
 <ZliGoM9Hy3Q2qthQ@intel.com>
 <4d9c15c6-cfe7-4535-b41a-fbfcb1e5f970@redhat.com>
Date: Mon, 03 Jun 2024 10:44:25 +0200
Message-ID: <87bk4ie7py.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 03 Jun 2024 08:44:36 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 30/05/2024 16.01, Zhao Liu wrote:
>> Hi Thomas,
>> BTW, do you think it's a good idea to define the overcommit via QAPI way
>> (defined in a json file)? ;-)
>> My rough understanding is that all APIs are better to be defined via
>> QAPI to go JSON compatible.
>
> Sorry, no clue whether it makes sense here... CC:-ing Markus for recommendations.

I'd love to have a machine-friendly, QAPI-based CLI with a
human-friendly CLI layered on top, similar to machine-friendly,
QAPI-based QMP / human-friendly HMP.

To get this with reasonable effort, we need better infrastructure.  We
have done a few complex options manually, such as -blockdev.  I
recommend this only when there's a clear need for JSON on the command
line.

I doubt this is the case for -overcommit.


