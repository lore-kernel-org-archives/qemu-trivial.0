Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rQBtN-0004Jp-RR
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jan 2024 14:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQBtK-0004JO-6A
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 14:48:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQBtI-0005cQ-1y
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 14:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705520877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 resent-to:resent-from:resent-message-id:in-reply-to:in-reply-to:
 references:references; bh=5D1670npY2V+R2n6CwrAED/nVrNrXgHnf+CzyLmDy6Q=;
 b=MgH3mWjGH5POjt/c92zWWx3FpMt2tyMMWZTI2L4h5H+VJwdV7m/HIA6IiXNEVsk7QZJO10
 5TdAQBx8Phg9zSSgYUfdHZ9dKeZiynct00esL0VTut6uJf8wMcBbA8bo7h7J46cKDcnCcn
 LMu4BFd14hkvPLhUbn8pcW+Igvddj98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-s8rDjFKYMDmPIGiju0xAyw-1; Wed, 17 Jan 2024 14:47:55 -0500
X-MC-Unique: s8rDjFKYMDmPIGiju0xAyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CDEC85A588;
 Wed, 17 Jan 2024 19:47:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6192166B35;
 Wed, 17 Jan 2024 19:47:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ABE8621E6806; Wed, 17 Jan 2024 20:47:49 +0100 (CET)
Resent-To: imbrenda@linux.ibm.com, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Wed, 17 Jan 2024 20:47:49 +0100
Resent-Message-ID: <87plxzg2sa.fsf@pond.sub.org>
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  qemu-trivial@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Claudio Imbrenda
 <imbrenda@linux.ibm.com>
Subject: Re: [PATCH 1/5] qemu-options: Remove the deprecated -no-hpet option
In-Reply-To: <20240112100059.965041-2-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 12 Jan 2024 11:00:55 +0100")
References: <20240112100059.965041-1-thuth@redhat.com>
 <20240112100059.965041-2-thuth@redhat.com>
Date: Wed, 17 Jan 2024 13:37:42 +0100
Message-ID: <87frywjfu1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 17 Jan 2024 19:48:02 -0000

Thomas Huth <thuth@redhat.com> writes:

> It's been marked as deprecated since QEMU 8.0, so it should be fine
> to remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


