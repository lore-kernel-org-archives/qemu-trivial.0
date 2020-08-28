Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBXZa-0000mb-GN
	for mharc-qemu-trivial@gnu.org; Fri, 28 Aug 2020 02:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kBXZV-0000lX-3b
 for qemu-trivial@nongnu.org; Fri, 28 Aug 2020 02:09:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53463
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kBXZS-0006fH-SR
 for qemu-trivial@nongnu.org; Fri, 28 Aug 2020 02:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598594945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gh/mDS6KUflXeDuucn6h5FZ6GUTrh2pM2WWu8pgjxjM=;
 b=dFcZdagyB49qrhwwy4SpQSurRaHOK9JjSRIXojeReVczP8K39GHmVpRvtdHuNOyp9YzPNB
 7AtbnIOgSCNIygWMzdxv73YTSjEkNQcfHJpqqtTWbjnH3GbByjcbjKjYlU1tlGtSKwE0nc
 fkyrnZTOsNClxFEAQf1+yaswiPQyGqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-fw8jgKXENZqVoi-coF0fAA-1; Fri, 28 Aug 2020 02:08:58 -0400
X-MC-Unique: fw8jgKXENZqVoi-coF0fAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7521F393B1;
 Fri, 28 Aug 2020 06:08:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1764960E1C;
 Fri, 28 Aug 2020 06:08:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91FD9112D737; Fri, 28 Aug 2020 08:08:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Rohit Shinde <rohit.shinde12194@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Subject: Re: [PATCH v5] qapi/opts-visitor: Added missing fallthrough
 annotations
References: <20200818105021.4998-1-rohit.shinde12194@gmail.com>
 <87o8mzjm7r.fsf@dusky.pond.sub.org>
 <CA+Ai=tD2QK9+GaXQoQWzKTPY-uZhLSCBeLUfz95eCiHv0v2i+A@mail.gmail.com>
 <87r1rsoc05.fsf@dusky.pond.sub.org>
 <CA+Ai=tANWy2=PmW8Le9t8Ehj97Uny1FE3gCyrV6i6HhoOc0DoQ@mail.gmail.com>
Date: Fri, 28 Aug 2020 08:08:55 +0200
In-Reply-To: <CA+Ai=tANWy2=PmW8Le9t8Ehj97Uny1FE3gCyrV6i6HhoOc0DoQ@mail.gmail.com>
 (Rohit Shinde's message of "Thu, 27 Aug 2020 17:07:30 -0700")
Message-ID: <871rjr5mko.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 01:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 28 Aug 2020 06:09:09 -0000

Rohit Shinde <rohit.shinde12194@gmail.com> writes:

> Hey Markus,
>
> Thanks for the clarification! No, I do not have patches for the same. I was
> browsing through the bite sized tasks page and that did not mention these
> details. I will keep this in mind however. For now, I will leave this task
> and I might return to it at a later time.

I corrected https://wiki.qemu.org/Contribute/BiteSizedTasks to ask for
-Wimplicit-fallthrough=2.  Thanks!


