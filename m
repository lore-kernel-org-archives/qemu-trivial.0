Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tyjws-0004dH-Ne
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 09:08:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Tyjwj-0004Jf-Jp
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 09:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Tyjwi-0002UP-FD
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 09:07:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:11135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1TyjwW-0002SH-IM; Fri, 25 Jan 2013 09:07:44 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PE7h0m018922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 09:07:44 -0500
Received: from [10.3.225.136] (vpn-225-136.phx2.redhat.com [10.3.225.136])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0PE7gBV003202; Fri, 25 Jan 2013 09:07:43 -0500
Message-ID: <510291AE.6@redhat.com>
Date: Fri, 25 Jan 2013 15:07:42 +0100
From: Michal Privoznik <mprivozn@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130114 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
	<87zjzx2wpp.fsf@blackfin.pond.sub.org>
In-Reply-To: <87zjzx2wpp.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx:
 s/tray-open/tray_open/ to match qapi schema
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 14:08:05 -0000

On 25.01.2013 14:55, Markus Armbruster wrote:
> Michal Privoznik <mprivozn@redhat.com> writes:
> 
>> Currently, we are using 'tray_open' in QMP and 'tray-open' in
>> HMP. However, the QMP documentation was mistakenly using the
>> HMP version.
> 
> Could you point me to where we're using "tray_open"?
> 

qemu.git $ git grep -npC8 tray_open qapi-schema.json

qapi-schema.json-683-# @type: This field is returned only for compatibility reasons, it should
qapi-schema.json-684-#        not be used (always returns 'unknown')
qapi-schema.json-685-#
qapi-schema.json-686-# @removable: True if the device supports removable media.
qapi-schema.json-687-#
qapi-schema.json-688-# @locked: True if the guest has locked this device from having its media
qapi-schema.json-689-#          removed
qapi-schema.json-690-#
qapi-schema.json:691:# @tray_open: #optional True if the device has a tray and it is open
qapi-schema.json-692-#             (only present if removable is true)
qapi-schema.json-693-#
qapi-schema.json-694-# @dirty: #optional dirty bitmap information (only present if the dirty
qapi-schema.json-695-#         bitmap is enabled)
qapi-schema.json-696-#
qapi-schema.json-697-# @io-status: #optional @BlockDeviceIoStatus. Only present if the device
qapi-schema.json-698-#             supports it and the VM is configured to stop on errors
qapi-schema.json-699-#
qapi-schema.json-700-# @inserted: #optional @BlockDeviceInfo describing the device if media is
qapi-schema.json-701-#            present
qapi-schema.json-702-#
qapi-schema.json-703-# Since:  0.14.0
qapi-schema.json-704-##
qapi-schema.json-705-{ 'type': 'BlockInfo',
qapi-schema.json-706-  'data': {'device': 'str', 'type': 'str', 'removable': 'bool',
qapi-schema.json-707-           'locked': 'bool', '*inserted': 'BlockDeviceInfo',
qapi-schema.json:708:           '*tray_open': 'bool', '*io-status': 'BlockDeviceIoStatus',
qapi-schema.json-709-           '*dirty': 'BlockDirtyInfo' } }
qapi-schema.json-710-
qapi-schema.json-711-##
qapi-schema.json-712-# @query-block:
qapi-schema.json-713-#
qapi-schema.json-714-# Get a list of BlockInfo for all virtual block devices.
qapi-schema.json-715-#
qapi-schema.json-716-# Returns: a list of @BlockInfo describing each virtual block device


